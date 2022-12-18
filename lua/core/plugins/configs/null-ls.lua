local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.prettierd,
  diagnostics.eslint,
  completion.spell,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})
