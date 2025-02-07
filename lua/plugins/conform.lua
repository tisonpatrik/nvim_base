return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        c = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            [[-style={"IndentWidth": 4, "TabWidth": 4, "UseTab": "Always", "ColumnLimit": 80, "SeparateDefinitionBlocks": "Always", "AllowShortFunctionsOnASingleLine": "None", "KeepEmptyLines": {"AtEndOfFile": false, "AtStartOfBlock": false, "AtStartOfFile": false}, "MaxEmptyLinesToKeep": 1, "SpacesBeforeTrailingComments": 1, "TrimTrailingWhitespace": true, "ReflowComments": false, "BreakBeforeBraces": "Custom", "PackConstructorInitializers": "Never"}]]
          },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}

