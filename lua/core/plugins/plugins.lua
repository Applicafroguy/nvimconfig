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

local plugins = {
	"arcticicestudio/nord-vim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"bluz71/vim-nightfly-guicolors",

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
	-- astro
	"wuelnerdotexe/vim-astro",

	{ "echasnovski/mini.nvim", branch = "stable" },

	"numToStr/Comment.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"harrisoncramer/jump-tag",

	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	"folke/which-key.nvim",
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)

	-- Lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"rafamadriz/friendly-snippets",
	"L3MON4D3/LuaSnip", -- Snippets plugin
	"onsails/lspkind.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
	},
	{ "phaazon/hop.nvim", branch = "v2" },
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-refactor",
}

local opts = {}

require("lazy").setup(plugins, opts)
