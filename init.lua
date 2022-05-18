require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.colorscheme"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.colorizer"
require "user.whichkey"
require "user.surround"
require "user.toggleterm"

-- cursorline underline instead of highlight
vim.cmd([[:hi clear CursorLine]])
vim.cmd([[:hi CursorLine gui=underline cterm=underline ctermfg=none]])
