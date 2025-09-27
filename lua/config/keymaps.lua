-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal ---------------------------------------------------------------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Leader yank/delete to clipboard
keymap("n", "<Leader>y", '"+y', { desc = "which_key_ignore" })
keymap("n", "<Leader>d", '"_d', { desc = "which_key_ignore" })

-- Center screen after <C-d> and <C-u>
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Center screen after n/N
keymap("n", "n", "nzzzv")
keymap("n", "N", "nzzzv")

-- Dont move cursor after case change
keymap("n", "~", "~h")

-- Insert ---------------------------------------------------------------------
-- esc
keymap("i", "<C-c>", "<ESC>")
keymap("i", "jk", "<ESC>")
keymap("i", "kj", "<ESC>")

-- Visual ---------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Leader yank/delete to clipboard
keymap("v", "<Leader>y", '"+y', { desc = "which_key_ignore" })
keymap("v", "<Leader>d", '"_d', { desc = "which_key_ignore" })

-- Visual Block --------------------------------------------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Leader yank/delete to clipboard
keymap("x", "<leader>y", '"_dP')

-- Noremap = false -----------------------------------------------------------
-- Leader yank/delete to clipboard
keymap("n", "<Leader>Y", '"+y', { noremap = false, silent = true, desc = "which_key_ignore" })
