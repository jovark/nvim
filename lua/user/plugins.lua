local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing pacler close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads nvim whenever you save plugins.lua
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popout window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua" }
    use { "akinsho/bufferline.nvim" }
    use { "moll/vim-bbye" }
    use { "folke/which-key.nvim" }
    use { "norcalli/nvim-colorizer.lua" }
    use { "ThePrimeagen/harpoon" }
    use { "Mephistophiles/surround.nvim" }
    use { "nvim-lualine/lualine.nvim" }

    -- Colorschemes
    use { "Xpunn/dracula.nvim-without-italics" }
    use { "Shatur/neovim-ayu" }
    use { "folke/tokyonight.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-cmdline" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

    -- copilot
    use {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require "user.copilot"
            end, 100)
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = "copilot.lua",
        config = function()
            require("copilot_cmp").setup()
        end
    }

    -- snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use { "nvim-treesitter/playground" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { "TimUntersberger/neogit" }

    -- At the end after all the plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
