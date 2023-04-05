local colorscheme = "tokyonight"
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
    require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            functions = { italic = false },
            variables = { italic = false },
            floats = "transparent",
            sidebars = "transparent",
        }
    })

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

if colorscheme == "catppuccin" then
    hl("@parameter", {
        bg = "none",
    })
    hl("@text.uri", {
        bg = "none",
    })
    hl("@text.literal", {
        bg = "none",
    })
    hl("@namespace", {
        bg = "none",
        fg = "#89b4fa",
    })
elseif colorscheme == "tokyonight" then
    hl("TabLineFill", {
        bg = "none",
    })
end

hl("TreesitterContext", {
    bg = "none",
})
hl("lualine_c_normal", {
    bg = "none",
})
