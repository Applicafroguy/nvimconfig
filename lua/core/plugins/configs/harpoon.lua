return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local ui = require("harpoon.ui")
		local map = vim.api.nvim_set_keymap

		local options = function(desc)
			local opts = { noremap = true, silent = true, desc = desc }
			return opts
		end


		vim.keymap.set("n", "<leader>m", function()
			require("harpoon.mark").add_file()
		end, options("Harpoon marker add"))
		vim.keymap.set("n", "<leader>.", function()
			ui.toggle_quick_menu()
		end, options("Harpoon marks menu"))

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, options("Harpoon navigates to next mark 1"))
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, options("Harpoon navigates to next mark 2"))

		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, options("Harpoon navigates to next mark 3"))
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, options("Harpoon navigates to next mark 4"))
		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end, options("Harpoon navigates to next mark 5"))

		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(6)
		end, options("Harpoon navigates to next mark 6"))

		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(7)
		end, options("Harpoon navigates to next mark 7"))

		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(8)
		end, options("Harpoon navigates to next mark 8"))
	end,
}
