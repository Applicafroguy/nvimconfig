require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"angularls",
		"bashls",
		-- "eslint",
		-- "emmet_ls",
		"html",
		"tsserver",
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
	},
})
