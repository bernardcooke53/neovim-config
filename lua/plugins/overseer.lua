return {
  "stevearc/overseer.nvim",
  opts = {},
  dependencies = {
    "stevearc/dressing.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>oo",
      function()
        return vim.cmd.OverseerRun({})
      end,
      desc = "Run [O]verseer task",
    },
    {
      "<leader>oa",
      function()
        require("overseer").toggle({
          direction = "right",
        })
      end,
      desc = "[O]verseer - List [A]ll tasks",
    },
  },
}
