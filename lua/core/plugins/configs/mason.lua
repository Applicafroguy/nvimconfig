require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "angularls",
    "astro",
    "cssls",
    "emmet_ls",
    "html",
    "tsserver",
    "tailwindcss",
    "volar",
  },
})
