local options = {
	backup = false,
    clipboard = "unnamedplus",
	cmdheight = 2,
	hlsearch = true,
	mouse = "a",
	pumheight = 10,
	showtabline = 2,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	timeoutlen = 100,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	scrolloff = 8,
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

vim.cmd [[set iskeyword+=-]]
