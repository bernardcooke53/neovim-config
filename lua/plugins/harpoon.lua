return {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        keys = {
            {
                "<leader>hh",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Toggle [H]arpoon quick menu",
            },
            {
                "<leader>hn",
                function()
                    require("harpoon.ui").nav_next()
                end,
                desc = "(Harpoon) next mark",
            },
            {
                "<leader>hb",
                function()
                    require("harpoon.ui").nav_prev()
                end,
                desc = "(Harpoon) previous mark",
            },
            {
                "<leader>hm",
                function()
                    require("harpoon.mark").add_file()
                end,
                desc = "(Harpoon) add file",
            },
        },
    }
