return {
	{
		"numToStr/Comment.nvim",
		keys = {
			{
				"gcc",
				mode = "n",
				desc = "Comment toggle current line",
			},
			{
				"gc",
				mode = { "n", "o", "x" },
				desc = "Comment toggle linewise",
			},
			{
				"gbc",
				mode = "n",
				desc = "Comment toggle current block",
			},
			{
				"gb",
				mode = { "n", "o", "x" },
				desc = "Comment toggle blockwise",
			},
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise.current()
				end,
				desc = "Toggle comment",
			},
			{
				"<leader>/",
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				mode = "v",
				desc = "Toggle comment",
			},
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},
}
