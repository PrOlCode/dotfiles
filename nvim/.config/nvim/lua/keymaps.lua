local options = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>w", ":w<CR>", options)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", options)
vim.keymap.set("n", "<leader>r", ":w<CR>:!go run %<CR>", options)

vim.keymap.set("n", "J", "<PageDown>")
vim.keymap.set("n", "K", "<PageUp>")

-- vim.keymap.set("n", "<leader>ss", "<cmd>SaveSession<CR>", { desc = "Сохранить сессию" })
-- vim.keymap.set("n", "<leader>sr", "<cmd>RestoreSession<CR>", { desc = "Восстановить сессию" })
-- vim.keymap.set("n", "<leader>sd", "<cmd>DeleteSession<CR>", { desc = "Удалить сессию" })

-- Навигация по ошибкам
vim.keymap.set("n", "]s", "]s")
vim.keymap.set("n", "[s", "[s")

-- :Telescope spell_suggest — предложения в попапе
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").spell_suggest,
  { desc = "Spell suggestions (Telescope)" })

vim.keymap.set("n", "<leader>sl", function()
  local cur = vim.opt.spelllang:get()
  if vim.tbl_contains(cur, "ru") then
    vim.opt.spelllang = { "en_us" }
    print("spelllang: en_us")
  else
    vim.opt.spelllang = { "en_us", "ru" }
    print("spelllang: en_us,ru")
  end
end, { desc = "Toggle Russian spelllang" })


-- Макросы

-- Хелпер для записи макросов в регистры
local function set_macro(reg, keys)
  local termcodes = vim.api.nvim_replace_termcodes(keys, true, true, true)
  vim.fn.setreg(reg, termcodes)  -- тип можно не указывать; по умолчанию посимвольно
end

set_macro("b", "ddi<BS> <Esc>0j")
set_macro("e", "/><CR>wv$ykkPj0ddjddi<BS> <Esc>0/==<CR>")
set_macro("w", [[:s/"//g<CR>:s/\./,/g<CR>:s/ //g<CR>]])

