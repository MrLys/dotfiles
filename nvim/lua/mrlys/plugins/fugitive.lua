return {
	-- git
	'tpope/vim-fugitive',
	config = function() 
		vim.keymap.set("n", "<leader>gs", ":Git<CR>")
		vim.keymap.set("n", "<leader>ga", ":Git add %<CR>")
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
		vim.keymap.set("n", "<leader>gp", ":Git -c push.default=current push<CR>")
	end
}
