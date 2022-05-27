local options = { backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    colorcolumn = "80",
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 100,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = false,
    scrolloff = 8,
    sidescrolloff = 8,
    incsearch = true,
    signcolumn = "yes",
    wrap = false,
    number = true,
    relativenumber = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
