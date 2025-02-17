local opt = vim.opt

-- Text formatting
opt.expandtab = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4



--vim.g.background = "light"
opt.swapfile = false

-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
--vim.opt.timeoutlen = 100





--vim.opt.encoding = "utf-8"
--vim.opt.fileencoding = "utf-8"


vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
--vim.opt.cmdheight = 1
--vim.opt.laststatus = 3
--vim.opt.scrolloff = 10
--vim.opt.shell = "fish"
--vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
--vim.opt.inccommand = "split"
--vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
--vim.opt.smarttab = true
--vim.opt.breakindent = true
vim.opt.wrap = true
--vim.opt.backspace = { "start", "eol", "indent" }
--vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
--vim.opt.wildignore:append({ "*/node_modules/*" })
--vim.opt.splitbelow = true -- Put new windows below current
--vim.opt.splitright = true -- Put new windows right of current
--vim.opt.splitkeep = "cursor"
--vim.opt.mouse = ""

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
-- vim.opt.formatoptions:append({ "r" })

-- vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
-- vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- if vim.fn.has("nvim-0.8") == 1 then
	-- vim.opt.cmdheight = 0
-- end



-- MARIO
-- vim.g.mapleader = ","
--
-- vim.opt.encoding = "utf-8"
--
-- vim.opt.compatible = false
-- vim.opt.hlsearch = true
-- vim.opt.relativenumber = true
-- vim.opt.laststatus = 2
-- vim.opt.vb = true
-- vim.opt.ruler = true
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"
-- vim.opt.autoindent = true
-- vim.opt.colorcolumn = "120"
-- vim.opt.textwidth = 120
-- vim.opt.mouse = "a"
-- vim.opt.clipboard = "unnamed"
-- vim.opt.scrollbind = false
-- vim.opt.wildmenu = true
--
-- vim.opt.tabstop = 3
-- vim.opt.shiftwidth = 3
--
--  filetype related 
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = {"gitcommit"},
--     callback = function(ev)
--         vim.api.nvim_set_option_value("textwidth", 72, {scope = "local"})
--     end
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = {"markdown"},
--     callback = function(ev)
--         vim.api.nvim_set_option_value("textwidth", 0, {scope = "local"})
--         vim.api.nvim_set_option_value("wrapmargin", 0, {scope = "local"})
--         vim.api.nvim_set_option_value("linebreak", 0, {scope = "local"})
--     end
-- })
--
