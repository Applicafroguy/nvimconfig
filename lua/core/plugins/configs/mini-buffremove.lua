return {
	"echasnovski/mini.bufremove",
	event = "VeryLazy",
	config = function(_, opts)
		require("mini.bufremove").setup()
	end,
}
