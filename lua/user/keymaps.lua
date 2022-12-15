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
-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap("n", "<leader>j", function() ui.nav_file(1) end)
keymap("n", "<leader>k", function() ui.nav_file(2) end)
keymap("n", "<leader>l", function() ui.nav_file(3) end)
keymap("n", "<leader>;", function() ui.nav_file(4) end)
keymap("n", "<leader>m", function() mark.add_file() end)
keymap("n", "<leader>u", function() ui.toggle_quick_menu() end)

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
keymap("n", "<Leader>y", '"+y')
keymap("n", "<Leader>d", '"_d')

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

-- Copilot
vim.cmd [[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

-- Visual ---------------------------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Leader yank/delete to clipboard
keymap("v", "<Leader>y", '"+y')
keymap("v", "<Leader>d", '"_d')

-- Visual Block --------------------------------------------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Leader yank/delete to clipboard
keymap("x", "<leader>y", '"_dP')

-- Terminal ------------------------------------------------------------------
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Noremap = false -----------------------------------------------------------
-- Leader yank/delete to clipboard
keymap("n", "<Leader>Y", '"+y', { noremap = false, silent = true })
