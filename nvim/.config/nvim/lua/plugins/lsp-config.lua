return {
	{
		"mason-org/mason.nvim",
		lazy = false,
	    opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = { "lua_ls", "pyright", "harper_ls" },
			automatic_enable = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})

			vim.lsp.config("harper_ls", {
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("harper_ls")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
