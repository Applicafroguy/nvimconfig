local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("arcticicestudio/nord-vim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	use("numToStr/Comment.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")

	-- Rename
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
