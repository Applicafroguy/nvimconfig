require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"angularls",
		"astro",
		"cssls",
		"eslint",
		"emmet_ls",
		"html",
		"tsserver",
		"tailwindcss",
		"volar",
		"jsonls",
		"yamlls",
	},
})
