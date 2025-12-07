return {
  "rmagatti/auto-session",
  lazy = false,

  -- -enables autocomplete for opts
  -- -@module "auto-session"
  -- -@type AutoSession.Config
  -- opts = {
  --   suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --   -- log_level = 'debug',
  -- },




	opts = {
    -- Автосохранение при выходе
    auto_save_enabled = true,

    -- Автоматическая загрузка при старте
    auto_restore_enabled = true,

    -- Восстанавливать последнюю сессию при запуске в несистемной директории
    -- auto_session_enable_last_session = true,

    -- Каталоги, в которых НЕ сохраняются и не восстанавливаются сессии
    suppressed_dirs = { "~/", "~/Downloads", "/", "~/Desktop" },

    -- -- Директория, куда сохранять сессии
    -- auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",

    -- (опционально) Уровень логов
    -- log_level = "info",
  },

  config = function(_, opts)
    require("auto-session").setup(opts)

    -- Горячие клавиши
    vim.keymap.set("n", "<leader>ss", "<cmd>SaveSession<CR>",   { desc = "💾 Сохранить сессию" })
    vim.keymap.set("n", "<leader>sr", "<cmd>RestoreSession<CR>", { desc = "🔁 Восстановить сессию" })
    vim.keymap.set("n", "<leader>sd", "<cmd>DeleteSession<CR>",  { desc = "❌ Удалить сессию" })
  end,
}
