return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
			},
			formatters = {
				-- -- C & C++
				["clang-format"] = {
					prepend_args = {
						"-style={ \
                         IndentWidth: 4, \
                         TabWidth: 4, \
                         UseTab: Never, \
                         AccessModifierOffset: 0, \
                         IndentAccessModifiers: true, \
                         PackConstructorInitializers: Never}",
					},
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
