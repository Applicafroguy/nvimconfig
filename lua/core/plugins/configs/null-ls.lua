local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.black,
  formatting.prettierd,
  formatting.stylua,
  diagnostics.mypy,
  diagnostics.ruff,
  completion.spell,
  -- require("typescript.extensions.null-ls.code-actions"),
}
--
local function on_attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    -- vim.cmd("command! -buffer Formatting lua vim.lsp.buf.formatting()")
    -- vim.cmd("command! -buffer FormattingSync lua vim.lsp.buf.formatting_sync()")
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

  -- end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
