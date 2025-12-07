return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>lS", "<cmd>Outline<CR>", desc = "Toggle Outline" },
  },
  opts = {
    -- Пример базовой конфигурации (всё можно оставить по умолчанию)
    outline_window = {
      position = "right",   -- или "left"
      width = 30,
      auto_jump = false,    -- автоматический переход к символу
    },
    symbols = {
      -- Здесь можно настроить отображаемые иконки и типы символов
      -- Например: Function = { icon = "ƒ", hl = "@function" },
    },
  },
  -- dependencies = {
  --   "nvim-lua/plenary.nvim",
  --   "neovim/nvim-lspconfig",  -- для LSP источников
  --   "nvim-treesitter/nvim-treesitter", -- для Treesitter источников
  -- },
}

