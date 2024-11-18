return {
	"filipdutescu/renamer.nvim",
	branch = "master",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("renamer").setup({})
	end,
}
