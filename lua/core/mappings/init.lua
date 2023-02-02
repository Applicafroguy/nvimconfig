local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- local nmap = function()
--   map()
-- end

g.mapleader = " "

-- Save
map("n", "<C-s>", ":w<CR>", opts)

-- Switch Windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Switch Buffers
map("n", "<Tab>", ":bn<CR>", opts)

-- Rename
map("n", "<leader>rn", ":lua require('renamer').rename()<CR>", opts)
map("i", "<F2>", ":lua require('renamer').rename()<CR>", opts)

-- will paste but not copy replaced text
map("x", "<leader>p", '"_dP', opts)

-- Clear Highlight
map("n", "<esc>", ":nohlsearch<CR>", opts)

-- PackerSync
map("n", "<S-u>", ":PackerSync<CR>", opts)

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
map("n", "<C-e>", ":NvimTreeFocus<CR>", opts)

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fm", ":Telescope media_files<cr>", opts)
map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map("n", "<Home>", ":Telescope buffers<cr>", opts)
map("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
map(
  "n",
  "<leader>ft",
  ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
  opts
)

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map("n", "zR", ':lua require("ufo").openAllFolds<CR>', opts)
map("n", "zM", ':lua require("ufo").closeAllFolds<CR>', opts)

-- Commenting
map("n", "<leader>/", ':lua require("Comment.api").toggle.linewise.current()<cr><ESC>', opts)
map("v", "<leader>/", '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Diagnis
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
