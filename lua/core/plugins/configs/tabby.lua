return {
	"TabbyML/vim-tabby",
	config = function()
		vim.g.tabby_trigger_mode = "auto"
		vim.g.tabby_keybinding_accept = "<Tab>"
		vim.g.tabby_keybinding_trigger_or_dismiss = "<C-\\>"
	end,
}
