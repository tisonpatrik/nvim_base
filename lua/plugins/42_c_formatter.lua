return {
  "Diogo-ss/42-C-Formatter.nvim",
  cmd = "CFormat42",
  config = function()
    local formatter = require("42-formatter")
    formatter.setup({
      formatter = 'c_formatter_42',
      filetypes = { c = true, h = true, cpp = true, hpp = true },
    })

    vim.api.nvim_set_keymap('n', '<F2>', ':CFormat42<CR>', { noremap = true, silent = true })

    local formatgrp = vim.api.nvim_create_augroup("C_format_42", {})

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = {"*.c", "*.h", "*.cpp", "*.hpp"},
      group = formatgrp,
      command = "CFormat42",
    })
  end
}

