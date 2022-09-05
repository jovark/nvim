local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup {
    options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false, -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
    },
    highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "#ff0000" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },

        background = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },

        buffer_selected = {
            fg = { attribute = 'fg', highlight = '#ff0000' },
            bg = { attribute = 'bg', highlight = '#0000ff' },
            bold = true,
            italic = false,
        },
        buffer_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },

        close_button = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },
        close_button_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },

        tab_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },
        tab = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        tab_close = {
            fg = { attribute = "fg", highlight = "TabLineSel" },
            bg = { attribute = "bg", highlight = "Normal" },
        },

        duplicate_selected = {
            fg = { attribute = "fg", highlight = "TabLineSel" },
            bg = { attribute = "bg", highlight = "TabLineSel" },
            italic = false,
        },
        duplicate_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
            italic = false,
        },
        duplicate = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
            italic = false,
        },

        modified = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },
        modified_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        modified_visible = {
            fg = { attribute = "fg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },

        separator = {
            fg = { attribute = "bg", highlight = "TabLine" },
            bg = { attribute = "bg", highlight = "TabLine" },
        },
        separator_selected = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        indicator_selected = {
            fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
    },
}
