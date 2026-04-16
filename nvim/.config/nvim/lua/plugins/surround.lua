return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  -- version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end
}
