local colorscheme = "catppuccin"
local line_nr_color

if colorscheme == "catppuccin" then
    vim.g.catpuccin_flavor = "mocha"

    require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
        compile = {
            enable = true,
            stylesheets = true,
            path = vim.fn.stdpath "cache" .. "/catppuccin"
        },
        styles = {
            comments = {},
            conditionals = {},
            functions = {},
            loops = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            cmp = true,
            nvimtree = true,
            treesitter_context = true,
            treesitter = true,
            telescope = true,
            which_key = true,
        },
        custom_highlights = {
            TSParameter = { style = {} },
            DiagnosticHint = { style = {} },
            DiagnosticError = { style = {} },
            DiagnosticInfo = { style = {} },
            DiagnosticWarn = { style = {} },
            TSTagAttribute = { style = {} },
        }
    })

    local colors = require("catppuccin.palettes").get_palette()
    line_nr_color = colors.blue

elseif colorscheme == "tokyonight" then
    vim.g.tokyonight_style = "night"

    -- Disables all italics --
    vim.g.tokyonight_italic_comments = false
    vim.g.tokyonight_italic_keywords = false
    vim.g.tokyonight_italic_functions = false
    vim.g.tokyonight_italic_keywords = false

    -- Transparency --
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_transparent_sidebar = true

    line_nr_color = "#7aa2f7"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. "not found")
    return
end

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

-- LineNr --
hl("LineNr", {
    fg = line_nr_color,
})

-- Couldn't get some italics disabled --
vim.cmd [[ highlight @tag.attribute gui = none ]]
vim.cmd [[ highlight @parameter gui=none ]]
vim.cmd [[ highlight @text.uri gui=none ]]
vim.cmd [[ highlight BufferLineBufferSelected gui=bold ]]
vim.cmd [[ highlight @text.literal gui=none ]]
