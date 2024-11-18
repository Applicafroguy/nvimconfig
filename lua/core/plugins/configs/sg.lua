return {

	"sourcegraph/sg.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
	},
	config = function()
		require("sg").setup({
			-- Pass your own custom attach function
			--    If you do not pass your own attach function, then the following maps are provide:
			--        - gd -> goto definition
			--        - gr -> goto references
		})
	end,
}
