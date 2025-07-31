#!/usr/bin/env bash
set -euo pipefail

# Directories
INSTALL_DIR="$HOME/.local/clangd"
BIN_DIR="$INSTALL_DIR/bin"
LIB_DIR="$INSTALL_DIR/lib"

mkdir -p "$BIN_DIR" "$LIB_DIR"

echo "🔍 Fetching latest clangd release info..."
RELEASE_JSON=$(curl -s https://api.github.com/repos/clangd/clangd/releases/latest)

# Get the download URL for the correct Linux zip asset
DOWNLOAD_URL=$(echo "$RELEASE_JSON" | jq -r '.assets[] | select(.name | test("clangd-linux-.*\\.zip$")) | .browser_download_url')

if [[ -z "$DOWNLOAD_URL" ]]; then
  echo "❌ Failed to find a suitable Linux .zip asset in the latest release."
  exit 1
fi

FILENAME=$(basename "$DOWNLOAD_URL")
VERSION=$(echo "$DOWNLOAD_URL" | grep -oP '[0-9]+\.[0-9]+\.[0-9]+')

echo "📦 Latest version: $VERSION"
echo "⬇️ Downloading: $FILENAME"

TMPDIR="$(mktemp -d)"
cd "$TMPDIR"
curl -LO "$DOWNLOAD_URL"

echo "📂 Unzipping..."
unzip -q "$FILENAME"

SRC_DIR=$(find . -maxdepth 1 -type d -name "clangd*" | head -n1)

cp -r "$SRC_DIR/bin/"* "$BIN_DIR/"
cp -r "$SRC_DIR/lib/"* "$LIB_DIR/"

cd ~
rm -rf "$TMPDIR"

# Add to PATH and LD_LIBRARY_PATH if not already
for shellrc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [[ -w "$shellrc" ]] && ! grep -q 'clangd/bin' "$shellrc"; then
    {
      echo ""
      echo "# clangd (user-local install)"
      echo "export PATH=\"\$HOME/.local/clangd/bin:\$PATH\""
      echo "export LD_LIBRARY_PATH=\"\$HOME/.local/clangd/lib:\$LD_LIBRARY_PATH\""
    } >> "$shellrc"
    echo "🔧 Added to $shellrc"
  fi
done

echo "✅ Installed clangd:"
"$BIN_DIR/clangd" --version

echo "👉 Restart your shell"

