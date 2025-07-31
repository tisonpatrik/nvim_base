# Neovim Setup for 42 School

This is a minimal Neovim setup designed specifically for 42 School. It does not rely on any distributions and is built from scratch, tailored to work with Clang, Make, and Bash.

## Features
- **Basic Setup**: No unnecessary dependencies, only essentials for 42 School.
- **Automatic Installation**: Uses Lazy and Mason to install everything automagically.
- **Language Support**: Primarily focused on C (Clang), Bash, and Makefiles.
- **Essential Plugins**: Includes LSP, Treesitter, Autopairs, Telescope, and more.

## Installation
1. **Install Neovim** if you haven’t already.

2. **Install Nerd Fonts**, for Ubuntu run this commands:
```bash
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts \
&& curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz \
&& tar -xf JetBrainsMono.tar.xz \
&& rm JetBrainsMono.tar.xz \
&& fc-cache -fv

```

3. **Clone this repository**:
```bash
   git clone https://github.com/tisonpatrik/nvim_base ~/.config/nvim
```

4. **Install Clangd** if you does not have it. Run
```bash
clangd --version
```
and if is no response or error, run

```bash
cd ~/.config.nvim \
./clangd_install.sh
```
and then restart shell

5. **Install C Formatter 42**

```bash
pip3 install --user c-formatter-42
```

6. **Start Neovim** and everything will install automagically:

```bash
 nvim 
```

## Usage
- Learn basic Vim moves
- Check every plugin what is installed and learn why its usefull (or why is not)
- Check key bindings
- **!!!CONTRIBUTE!!!!**

## Full version

For a more feature-rich setup, check out the full version here:

[GitHub - tisonpatrik/nvim](https://github.com/tisonpatrik/nvim)

