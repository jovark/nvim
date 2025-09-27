-- Enable LSP servers
vim.lsp.enable({
    "ts_ls",
    "lua_ls",
    "tailwindcss",
    "eslint",
    "rust_analyzer",
    "gopls",
    "html",
    "cssls",
    "basedpyright",
    "bashls",
    "css_variables",
    "cssmodules_ls",
    "dockerls",
    "grammarly",
    "jsonls",
    "lemminx",
    "marksman",
    "taplo",
    "yamlls",
})

-- Configure diagnostic display with custom signs
vim.diagnostic.config({
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true, -- Show source in diagnostic popup window
        header = "",
        prefix = "",
    },
    virtual_text = false,
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Enable inlay hints
vim.lsp.inlay_hint.enable(true)

-- Create default capabilities without cmp
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
    capabilities = lsp_capabilities,
})

-- Add additional capabilities supported by blink-cmp
local blink_status_ok, blink = pcall(require, "blink.cmp")
if blink_status_ok then
    local ext_capabilities = vim.tbl_deep_extend("force", {}, lsp_capabilities, blink.get_lsp_capabilities())
    -- Configure LSP servers using the new vim.lsp.config syntax
    -- Default configuration for all servers
    vim.lsp.config("*", {
        capabilities = ext_capabilities,
    })
end

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)

        opts.desc = "which_key_ignore"
        keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)

        opts.desc = "which_key_ignore"
        keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    end,
})
