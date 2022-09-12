require("plugins")
vim.g.catppuccin_flavor = "macchiato"

require("catppuccin").setup({
	transparent_background = true,
	term_colors = false,
})

vim.cmd [[colorscheme catppuccin]]
-- require("budzilla").setup()
