local options = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>w", ":w<CR>", options)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", options)
vim.keymap.set("n", "<leader>r", ":w<CR>:!go run %<CR>", options)
