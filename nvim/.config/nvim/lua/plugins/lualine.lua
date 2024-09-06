return{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = 'auto'
        -- theme = "gruvbox",
        -- theme = "iceberg",
        theme = "nord",
      },
    })
  end,
}
