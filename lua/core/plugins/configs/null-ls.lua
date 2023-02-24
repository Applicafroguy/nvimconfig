local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua,
  formatting.prettierd.with({
    condition = function(utils)
      return utils.has_file({ ".prettierrc.js" })
    end,
  }),
  diagnostics.eslint_d.with({
    condition = function(utils)
      local has_file = utils.root_has_file
      local has = has_file({ ".eslintrc.js" })
          or has_file({ ".eslintrc.json" })
          or has_file({ ".eslintrc.yml" })
          or has_file({ ".eslintrc" })
          or has_file({ ".eslintrc.cjs" })
          or has_file({ "eslint.config.js" })
      return utils.root_has_file({ ".eslintrc.js" })
    end,
  }),
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
