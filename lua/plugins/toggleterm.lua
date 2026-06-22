local vsplit_win_size = vim.api.nvim_win_get_width(0) / 3
local hsplit_win_size = vim.api.nvim_win_get_height(0) / 3

return {
  "akinsho/toggleterm.nvim",
  opts = {--[[ things you want to change go here]]
  },
  config = true,
  keys = {
    {
      "<leader>tt",
      function()
        vim.cmd.TermSelect({})
      end,
      desc = "Select [T]erminal",
    },
    {
      "<leader>ta",
      function()
        vim.cmd.ToggleTermToggleAll({})
      end,
      desc = "Toggle [A]ll Terminals",
    },
    {
      "<leader>th",
      function()
        vim.cmd.ToggleTerm({
          args = {
            string.format("size=%d", hsplit_win_size),
            'direction="horizontal"',
            string.format("dir=%s", vim.fn.getcwd()),
          },
        })
      end,
      desc = "Toggle [H]orizontal Terminal",
    },
    {
      "<leader>tp",
      function()
        local python3 = vim.fn.executable("python3") == 1 and "python3"
        local python = vim.fn.executable("python") == 1 and "python"
        local command = python3 or python or nil
        if command then
          return require("toggleterm").exec(
            command,
            0,
            hsplit_win_size,
            vim.uv.cwd(),
            "horizontal",
            "Python 3",
            false,
            true
          )
        end
      end,
      desc = "ToggleTerm python",
    },
    {
      "<leader>rp",
      function()
        local python3 = vim.fn.executable("python3") == 1 and "python3"
        local python = vim.fn.executable("python") == 1 and "python"
        local command = python3 or python or nil
        if command then
          return require("toggleterm").exec(
            string.format("%s %s", command, vim.fn.expand("%")),
            0,
            hsplit_win_size,
            vim.uv.cwd(),
            "horizontal",
            "Python 3",
            false,
            true
          )
        end
      end,
      desc = "Run python file",
    },
    {
      "<leader>tv",
      function()
        vim.cmd.ToggleTerm({
          args = {
            string.format("size=%d", vsplit_win_size),
            'direction="vertical"',
            string.format("dir=%s", vim.uv.cwd()),
          },
        })
      end,
      desc = "Toggle [V]ertical Terminal",
    },
  },
  lazy = false,
}
