return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt", "goimports-reviser", "golines" },
			},
			formatters = {
				["goimports-reviser"] = {
					prepend_args = { "-rm-unused" },
				},
				golines = {
					prepend_args = { "--max-len=80" },
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
