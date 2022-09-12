vim.g.maplocalleader = "\\\\"
vim.opt.swapfile = false
vim.opt.backup = false
require("plugins")
vim.g.catppuccin_flavor = "macchiato"

require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
})
require("telescope").load_extension('harpoon')
require("debuglog").setup()
vim.cmd [[colorscheme catppuccin]]
vim.api.nvim_set_keymap('n', '<Leader>.', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>;', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':luafile %<CR>', { noremap = true, silent = true })
-- require("budzilla").setup()
