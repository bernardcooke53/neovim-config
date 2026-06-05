return {
        "kosayoda/nvim-lightbulb",
        require = "antoinemadec/FixCursorHold.nvim",
        opts = function(opts)
            opts.autocmd = { enabled = true }
        end,
    }
