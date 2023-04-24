local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    key_labels = {
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = false, -- show help message on the command line when the popup is visible
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    g = { "<cmd>Neogit<cr>", "Neogit" },
    h = { "<cmd>nohlsearch<CR>", "No HL" },
    t = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
    p = {
        name = "Plugins",
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        i = { "<cmd>Lazy install<cr>", "Install" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        h = { "<cmd>Lazy help<cr>", "Help" },
        m = { "<cmd>Mason<cr>", "Mason" },
    },
    F = {
        name = "Find",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = {
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
            "Find files",
        },
        t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
    s = {
        name = "Surround",
        ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
        a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
        d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
        r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
        q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
        b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
    },
    T = {
        name = "Treesitter",
        h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
        p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
    },
}

local vopts = {
    mode = "v", -- VISUAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
    ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
    s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
