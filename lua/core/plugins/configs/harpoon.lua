local harpoon = require("harpoon")
local map = vim.api.nvim_set_keymap

local options = function(desc)
  local opts = { noremap = true, silent = true, desc = desc }
  return opts
end

harpoon:setup()

vim.keymap.set("n", "<leader>m", function()
  harpoon:list():append()
end, options("Harpoon marker add"))
vim.keymap.set("n", "<leader>.", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, options("Harpoon marks menu"))

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end, options("Harpoon navigates to next mark 1"))
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end, options("Harpoon navigates to next mark 2"))

vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end, options("Harpoon navigates to next mark 3"))
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end, options("Harpoon navigates to next mark 4"))
vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end, options("Harpoon navigates to next mark 5"))
