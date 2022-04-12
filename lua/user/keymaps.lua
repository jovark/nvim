local k = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

-- Space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --
-- Window navigation
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

k("n", "<leader>e", ":Lex 20<cr>", opts)

-- Navigate buffers
k("n", "<S-l>", ":bnext<CR>", opts)
k("n", "<S-h>", ":bprevios<CR>", opts)

-- Insert --
k("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- Move text up and down
k("v", "<A-j>", ":m .+1<CR>==", opts)
k("v", "<A-k>", ":m .-2<CR>==", opts)
k("v", "p", '"_P', opts)

-- Visual Block --
-- Move text up and down
k("x", "<J>", ":move '>+1<CR>gv-gv", opts)
k("x", "<K>", ":move '<-2<CR>gv-gv", opts)
k("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
k("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
k("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
k("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
