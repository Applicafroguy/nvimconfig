require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "typescript",
    "lua",
    "css",
    "html",
    "javascript",
    "astro",
    "vue",
    "vim",
    "gitignore",
    "dockerfile",
    "bash",
    "rust",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
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
