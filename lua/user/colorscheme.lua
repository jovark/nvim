local colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

-- Disables all italics --
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_keywords = false

-- Transparency --
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found")
    return
end

-- LineNr --
local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("LineNr", {
    fg = "#7dcfff"
})
