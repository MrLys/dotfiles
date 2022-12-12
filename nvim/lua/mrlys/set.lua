-- most of these are copied from https://github.com/ThePrimeagen/init.lua/blob/e7c7507ca35ceaefcaac45b7cf504475ad4793e9/lua/theprimeagen/set.lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true

vim.opt.signcolumn = "yes"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
