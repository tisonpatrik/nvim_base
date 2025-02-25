return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				automatic_installation = false,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			-- List of servers to ignore during install
			local ignore_install = {}

			-- Helper function to find if value is in table.
			local function table_contains(table, value)
				for _, v in ipairs(table) do
					if v == value then
						return true
					end
				end
				return false
			end

			-- Build a list of lsp servers to install minus the ignored list.
			local all_servers = {}
			for _, s in ipairs(lspconfig.servers) do
				if not table_contains(ignore_install, s) then
					table.insert(all_servers, s)
				end
			end
			require("mason-lspconfig").setup({
				ensure_installed = all_servers,
				automatic_installation = false,
			})
		end,
	},
	{
		"zapling/mason-conform.nvim",
		config = function()
			require("mason-conform").setup({
				automatic_installation = false,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "mfussenegger/nvim-lint" },
		config = function()
			local lint = package.loaded["lint"]

			-- List of linters to ignore during install
			local ignore_install = {}

			-- Helper function to find if value is in table.
			local function table_contains(tbl, value)
				for _, v in ipairs(tbl) do
					if v == value then
						return true
					end
				end
				return false
			end

			-- Build a list of linters to install minus the ignored list.
			local all_linters = {}
			for _, v in pairs(lint.linters_by_ft) do
				for _, linter in ipairs(v) do
					if not table_contains(ignore_install, linter) then
						table.insert(all_linters, linter)
					end
				end
			end

			require("mason-nvim-lint").setup({
				ensure_installed = all_linters,
				automatic_installation = false,
			})
		end,
	},
}
