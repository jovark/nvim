local M = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>m", function()
            harpoon:list():add()
        end, { desc = "which_key_ignore" })
        vim.keymap.set("n", "<leader>u", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open Harpoon quick menu" })

        vim.keymap.set("n", "<leader>j", function()
            harpoon:list():select(1)
        end, { desc = "which_key_ignore" })
        vim.keymap.set("n", "<leader>k", function()
            harpoon:list():select(2)
        end, { desc = "which_key_ignore" })
        vim.keymap.set("n", "<leader>l", function()
            harpoon:list():select(3)
        end, { desc = "which_key_ignore" })
        vim.keymap.set("n", "<leader>;", function()
            harpoon:list():select(4)
        end, { desc = "which_key_ignore" })
    end,
}

return M
