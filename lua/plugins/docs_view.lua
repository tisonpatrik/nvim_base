return {
  "amrbashir/nvim-docs-view",
  config = function()
    require("lazy").setup {
      lazy = true,
      cmd = "DocsViewToggle",
      opts = {
        position = "right",
        width = 60
      }
    }
  end
}

