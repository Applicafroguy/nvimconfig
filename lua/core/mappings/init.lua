local g = vim.g
local map = vim.api.nvim_set_keymap

local options = function(desc)
	local opts = { noremap = true, silent = true, desc = desc }
	return opts
end

g.mapleader = " "

-- Save
map("n", "<C-s>", ":w<CR>", options(""))

-- Fix Vue
map("n", "<C-x>", ":write | edit | TSBufEnable highlight<CR>", options("Fix Vue white highlight"))

-- Switch Windows
map("n", "<C-h>", "<C-w>h", options(""))
map("n", "<C-j>", "<C-w>j", options(""))
map("n", "<C-k>", "<C-w>k", options(""))
map("n", "<C-l>", "<C-w>l", options(""))

-- Navigation
map("n", "<S-h>", ":HopWord<cr>", options(""))

-- Zenmode
map("n", "<F11>", ":ZenMode<cr>", options(""))

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", options("Move down"))
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Remove Buffer
map("n", "<leader>bd", ":lua MiniBufremove.delete(0,false)<cr>", options("Delete Buffer"))
map("n", "<leader>bD", ":lua MiniBufremove.delete(0,true)<cr>", options("Delete Buffer"))

-- Resize window using <ctrl> arrow keys
map("n", "<C-Down>", "<cmd>resize +2<cr>", { desc = "Decrease window height" })
map("n", "<C-Up>", "<cmd>resize -2<cr>", { desc = "Increase window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Switch Buffers
map("n", "<Tab>", ":bn<CR>", options("Swithc Buffers"))

-- Rename
map("n", "<leader>rn", ":lua require('renamer').rename()<CR>", options(""))
map("i", "<F2>", ":lua require('renamer').rename()<CR>", options(""))

-- will paste but not copy replaced text
map("x", "p", '"_dP', options(""))

-- Clear Highlight
map("n", "<esc>", ":nohlsearch<CR>", options(""))

-- NvimTree
map("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", options("Toggles NvimTree to selected buffer"))
map("n", "<C-e>", ":NvimTreeFindFile<CR>", options(""))

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", options("Find Files"))
map("n", "<leader>fm", ":Telescope media_files<cr>", options(""))
map("n", "<leader>fg", ":Telescope live_grep<cr>", options(""))
map("n", "<leader>fb", ":Telescope buffers<cr>", options("Find Buffers"))
map("n", "<Home>", ":Telescope buffers<cr>", options(""))
map("n", "<leader>fh", ":Telescope help_tags<cr>", options(""))
map(
	"n",
	"<leader>ft",
	":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
	options("Find Files in dropdown")
)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map("n", "zR", ':lua require("ufo").openAllFolds<CR>', options(""))
map("n", "zM", ':lua require("ufo").closeAllFolds<CR>', options(""))

-- Commenting
-- map("n", "<leader>/", ':lua require("Comment.api").toggle.linewise.current()<cr><ESC>', options(""))
-- map("n", "<leader>/", ":ToggleComment<cr>", options(""))
-- map("v", "<leader>/", "<ESC><CMD>ToggleCommentSelection<CR>", options(""))
-- map("v", "<leader>/", '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', options(""))

-- Diagnis
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", options(""))
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", options(""))
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", options(""))
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", options(""))
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", options(""))
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", options(""))

-- Jump tag
map("n", "<leader>55", ':lua require("jump-tag").jumpParent()<CR>', options("Jump Parent Tag"))
map("n", "<leader>5n", ':lua require("jump-tag").jumpNexSibling()<CR>', options("Jump Next Sibling Tag"))
map("n", "<leader>5p", ':lua require("jump-tag").jumpPrevSibling()<CR>', options("Jump Prev Sibling Tag"))
map("n", "<leader>5c", ':lua require("jump-tag").jumpChild()<CR>', options("Jump Child Tag"))
