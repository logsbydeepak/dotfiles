vim.g.mapleader = " "

vim.opt.spelllang = "en_us"
vim.opt.spell = false
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

-- Enable spell check only for prose filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
