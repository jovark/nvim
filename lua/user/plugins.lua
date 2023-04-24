local fn = vim.fn

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads nvim whenever you save plugins.lua
vim.cmd [[
    augroup lazy_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | Lazy sync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

return lazy.setup({
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'windwp/nvim-autopairs',
        'numToStr/Comment.nvim',
        'kyazdani42/nvim-web-devicons',
        'kyazdani42/nvim-tree.lua',
        'moll/vim-bbye',
        'folke/which-key.nvim',
        'norcalli/nvim-colorizer.lua',
        'ThePrimeagen/harpoon',
        'Mephistophiles/surround.nvim',
        'nvim-lualine/lualine.nvim',
        'unblevable/quick-scope',

        -- Colorschemes
        'Xpunn/dracula.nvim-without-italics',
        'Shatur/neovim-ayu',
        'folke/tokyonight.nvim',
        {
            'catppuccin/nvim',
            as = 'catppuccin',
        },

        -- cmp plugins
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        {
            'tzachar/cmp-tabnine',
            build = './install.sh',
            dependencies = 'hrsh7th/nvim-cmp'
        },

        -- copilot
        {
            "zbirenbaum/copilot.lua",
            event = 'VimEnter',
            config = function()
                vim.defer_fn(function()
                    require "user.copilot"
                end, 100)
            end,
            dependencies = {
                "zbirenbaum/copilot-cmp",
            }
        },

        -- snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',

        -- LSP
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'jose-elias-alvarez/null-ls.nvim',

        -- Telescope
        'nvim-telescope/telescope.nvim',

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
        },
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/playground',

        -- Git
        'lewis6991/gitsigns.nvim',
        'TimUntersberger/neogit',
    })
