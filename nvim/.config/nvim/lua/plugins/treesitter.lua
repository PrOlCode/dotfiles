return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "csv",
        "dockerfile",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "yaml",
        "vim",
        "vimdoc",
        "query",
      },

      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { "python", "yaml" },
      },
    },
  },
}
