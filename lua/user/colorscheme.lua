vim.cmd [[
try
  colorscheme onedarker  
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Transparency --
vim.cmd([[
    highlight Normal guibg=none,
    highlight NonText guibg=none,
    highlight SignColumn guibg=none,
    highlight NvimTreeNormal guibg=none,
    highlight NvimTreeVertSplit guibg=none,
]])

-- Disavle italics --
vim.cmd([[highlight comment gui=none]])
