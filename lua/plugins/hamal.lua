return {
  "ergodice/hamal.nvim",
  config = function()
    local hamal = require("hamal")

    -- keymaps
    vim.keymap.set("n", "<c-n>", hamal.split)
    vim.keymap.set("o", "<c-n>", hamal.split) -- To use hamal mode in the o-pending mode.
    vim.keymap.set("v", "<c-n>", hamal.split)

    -- You must call hamal.setup() at least once.
    hamal.setup({})
  end,
}
