vim.g.mapleader = " "

vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.signcolumn = "yes"
vim.o.autoread = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8

vim.opt.spelllang = "en_us"

vim.opt.wrap = true
vim.opt.linebreak = true

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

