local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({{import = "plugins"}})

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
vim.api.nvim_set_option("clipboard","unnamedplus")
vim.keymap.set("v", "<c-y>", "\"+", {})

local augroup = vim.api.nvim_create_augroup
local mrlysGroup = augroup("mrlys", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWritePre"}, {
 group = mrlysGroup,
 pattern = "*",
 command = "%s/\\s\\+$//e",
})
