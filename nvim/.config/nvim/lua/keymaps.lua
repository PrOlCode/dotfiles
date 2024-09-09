local options = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>w", ":w<CR>", options)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", options)

vim.api.nvim_set_keymap("n", "<leader>r", ":!go run %<CR>", options)
