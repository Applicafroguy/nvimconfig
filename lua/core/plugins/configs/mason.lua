require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "angularls",
    "bashls",
    "astro",
    "cssls",
    "eslint",
    "emmet_ls",
    "html",
    "tsserver",
    "black",
    "mypy",
    "ruff",
    "pyright",
    "tailwindcss",
    "volar",
    "jsonls",
    "yamlls",
    "leptosfmt",
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier", -- prettier formatter
    "stylua", -- lua formatter
    "isort",  -- python formatter
    "black",  -- python formatter
    "pylint", -- python linter
    "eslint_d", -- js linter
  },
})
