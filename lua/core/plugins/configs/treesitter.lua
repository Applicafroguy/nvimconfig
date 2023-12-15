require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "vim",
    "vimdoc",
    "c",
    "query",
    "lua",
    "typescript",
    "css",
    "html",
    "json",
    "javascript",
    "astro",
    "vue",
    "gitignore",
    "dockerfile",
    "toml",
    "bash",
    "python",
    "rust",
    "markdown",
    "markdown_inline",
    "clojure",
    "dockerfile",
    "terraform",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },
})
