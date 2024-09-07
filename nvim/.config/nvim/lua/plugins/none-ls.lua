return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- null_ls.builtins.diagnostics.selene, -- lua linter
          null_ls.builtins.formatting.stylua,    -- lua formatter
          null_ls.builtins.diagnostics.golangci_lint, -- go linter
          null_ls.builtins.diagnostics.pylint,   -- python linter
          null_ls.builtins.formatting.black,     -- python formatter
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    requires = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "selene",
          "stylua",
          "golangci-lint",
          "pylint",
          "black",
        },
        auto_update = false,
        run_on_start = true,
        start_delay = 3000,
      })
    end,
  },
}
