return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.formatting.golines,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.formatting.prettier,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
