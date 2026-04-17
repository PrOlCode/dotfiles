return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      ts.install({
        "csv",
        "dockerfile",
        "gitignore",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "vim",
        "vimdoc",
        "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "csv",
          "dockerfile",
          "gitignore",
          "json",
          "lua",
          "markdown",
          "python",
          "query",
          "vim",
          "yaml",
        },
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
