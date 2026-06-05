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
			    string.format("size=%d", vsplit_win_size),
			    'direction="vertical"',
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
		    if python3 then
			return vim.cmd.TermExec({
			    args = {
				"cmd=python3",
				string.format("size=%d", vsplit_win_size),
				"name=python3",
				'direction="vertical"',
				string.format("dir=%s", vim.fn.getcwd()),
			    },
			})
			-- TODO: this would set insert mode, but we are still in the wrong buffer
			-- local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			-- vim.api.nvim_feedkeys(keys, "i", true)
		    end
		    local python = vim.fn.executable("python") == 1 and "python"
		    if python then
			vim.cmd.TermExec({
			    args = {
				"cmd=python",
				string.format("size=%d", vsplit_win_size),
				"name=python",
				'direction="vertical"',
				string.format("dir=%s", vim.fn.getcwd()),
			    },
			})
			-- TODO: this would set insert mode, but we are still in the wrong buffer
			-- local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			-- vim.api.nvim_feedkeys(keys, "i", true)
		    end
		end,
		desc = "ToggleTerm python",
	    },
	},
	lazy = false,
}
