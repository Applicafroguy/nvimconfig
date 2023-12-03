local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

local root_has_file = function(files)
  return function(utils)
    return utils.root_has_file(files)
  end
end

local eslint_root_files =
{ ".eslintrc", ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml", ".eslintrc.cjs", "eslint.config.js" }
local prettier_root_files = { ".prettierrc", ".prettierrc.js", ".prettierrc.json" }
local stylua_root_files = { "stylua.toml", ".stylua.toml" }

local opts = {
  eslint_formatting = {
    condition = function(utils)
      local has_eslint = root_has_file(eslint_root_files)(utils)
      local has_prettier = root_has_file(prettier_root_files)(utils)
      print(has_prettier, has_eslint)
      return has_eslint and not has_prettier
    end,
  },
  eslint_diagnostics = {
    condition = root_has_file(eslint_root_files),
  },
  prettier_formatting = {
    condition = root_has_file(prettier_root_files),
  },
  stylua_formatting = {
    condition = root_has_file(stylua_root_files),
  },
}

local sources = {
  formatting.stylua,
  formatting.black,
  formatting.prettierd.with(opts.prettier_formatting),
  formatting.leptosfmt,
  -- formatting.eslint.with(opts.eslint_formatting),
  formatting.stylua.with(opts.stylua_formatting),
  diagnostics.eslint.with(opts.eslint_diagnostics),
  diagnostics.mypy,
  diagnostics.ruff,
  completion.spell,
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
