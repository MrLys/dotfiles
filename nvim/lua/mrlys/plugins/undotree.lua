return {
	'mbbill/undotree',
	config = function() 
		vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>U", "<cmd>Telescope undo<cr>")
	end
}
