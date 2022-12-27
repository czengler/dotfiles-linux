local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Normal mode --
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better inserting and deleting
keymap("n", "<leader>p", "\"_dP", opts)
keymap("n", "<leader>d", "\"_d", opts)
keymap("v", "<leader>d", "\"_dP", opts)

-- better <C-d> and <C-u> movement
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "]b", ":bnext<cr>", opts)
keymap("n", "[b", ":bprevious<cr>", opts)

-- Move single lines
keymap("n", "∆", ":m .+1<cr>==", opts)
keymap("n", "˚", ":m .-2<cr>==", opts)

-- Visual mode --
-- Indent & stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --
-- Gitsigns
keymap("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "]g", "<cmd>Gitsigns next_hunk<cr>", opts)

-- Bufferline
for i = 1, 9 do
	keymap("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", opts)
end
