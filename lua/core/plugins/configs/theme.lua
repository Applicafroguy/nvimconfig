return {
	"folke/tokyonight.nvim",
	lazy = true,
	opts = { style = "moon" },
	config = function()
		local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
		if not status then
			print("Colorscheme not found!") -- print error if colorscheme not installed
			return
		end
		require("tokyonight").setup({ transparent = vim.g.transparent_enabled })
	end,
}
