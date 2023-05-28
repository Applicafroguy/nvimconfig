local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--[[local astro_comm = {
	"Applicafroguy/astro-comm",
	branch = "main",
	dependencies = {
		{ "numToStr/Comment.nvim" },
	},
} --]]
-- if os.getenv("MACHINE") == "tg-desctop" then
-- 	-- For Dev
-- 	astro_comm = { dir = "/home/tg/Projects/OpenSource/NVIM-Plugins/astro-comm" }
-- end

local plugins = {
  "arcticicestudio/nord-vim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "bluz71/vim-nightfly-guicolors",
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  --astro_comm,

  -- Telescope
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  "folke/zen-mode.nvim",
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    }
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- astro
  "wuelnerdotexe/vim-astro",
  "nvim-telescope/telescope-file-browser.nvim",
  "b0o/schemastore.nvim",
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- {
  -- 	"Applicafroguy/astro-comm",
  -- 	branch = "main",
  -- 	dependencies = {
  -- 		{ "numToStr/Comment.nvim" },
  -- 	},
  -- },
  -- "numToStr/Comment.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "harrisoncramer/jump-tag",
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  "folke/which-key.nvim",
  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

  -- Navigation
  "ThePrimeagen/harpoon",

  -- Lsp
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",         -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",         -- Snippets plugin
  "onsails/lspkind.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
  },
  { "phaazon/hop.nvim",      branch = "v2" },
  {
    "filipdutescu/renamer.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
  },

  "Olical/conjure",
  { "echasnovski/mini.bufremove",                  version = false },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  { "echasnovski/mini.surround",                   version = false },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "<leader>/",

        -- Toggle comment on current line
        comment_line = "<leader>/",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "<leader>/",
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  { "tpope/vim-repeat",                event = "VeryLazy" },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-refactor",
}

local opts = {}

require("lazy").setup(plugins, opts)
