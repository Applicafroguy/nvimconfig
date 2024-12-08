return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"angularls",
				"bashls",
				-- "eslint",
				"html",
				"ts_ls",
				"ruff_lsp",
				"tailwindcss",
				"volar",
				"jsonls",
				"yamlls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"prettierd",
			},
		})
	end,
}
