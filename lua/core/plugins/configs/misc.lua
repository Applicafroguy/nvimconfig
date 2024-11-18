return {
	"arcticicestudio/nord-vim",
--	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"bluz71/vim-nightfly-guicolors",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"mfussenegger/nvim-dap",
	-- Telescope
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup()
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",
	"b0o/schemastore.nvim",
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"harrisoncramer/jump-tag",
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	-- Lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"hrsh7th/cmp-nvim-lua",
	{
		"doxnit/cmp-luasnip-choice",
		config = function()
			require("cmp_luasnip_choice").setup({
				auto_open = true, -- Automatically open nvim-cmp on choice node (default: true)
			})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	-- Treesitter
	"xiyaowong/nvim-transparent",
	"nvim-treesitter/nvim-treesitter-refactor",
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	"tpope/vim-fugitive",
}
