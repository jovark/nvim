local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found")
    return
end

-- Transparency --
vim.cmd([[
    highlight Normal guibg=none,
    highlight NonText guibg=none,
    highlight SignColumn guibg=none,
    highlight NvimTreeNormal guibg=none,
    highlight NvimTreeVertSplit guibg=none,
 ]])
