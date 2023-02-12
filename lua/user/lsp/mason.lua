local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_config, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_config then
    return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
    return
end

local servers = {
    "cssls",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "jdtls",
    "jsonls",
    "lua_ls",
    "tsserver",
    "bashls",
    "dockerls",
    "taplo",
    "rust_analyzer",
    "eslint",
}

local settings = {
    ui = {
        border = "rounded",
    },
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    if server == "lua-language-server" then
        local lua_ls_opts = require "user.lsp.settings.lua_ls"
        opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    end

    if server == "tsserver" then
        local tsserver_opts = require "user.lsp.settings.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    lspconfig[server].setup(opts)
end
