local colorscheme = "ayu-mirage"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found")
    return
end

-- Transparency --
local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

vim.cmd([[highlight BufferlineFill guibg=none]])
vim.cmd([[highlight NvimTreeVertSplit guibg=none]])

hl("Normal", {
    bg = "None"
})

hl("SignColumn", {
    bg = "None"
})

hl("BufferLineBackground", {
    bg = "None"
})

hl("BufferLineSeparator", {
    bg = "None"
})

hl("BufferLineCloseButton", {
    bg = "None"
})

hl("LineNr", {
    fg = "#5ccfe6"
})
