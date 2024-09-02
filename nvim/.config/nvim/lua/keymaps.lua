local options = { noremap = true, silent = true }
-- vim.keymap.set("i", "jk", "<Esc>", options)
-- vim.keymap.set("i", "ол", "<Esc>", options)
vim.keymap.set("n", "<Leader>w", ":w<CR>", options)
vim.keymap.set("n", "<Leader>c", ":bdelete<CR>", options)
