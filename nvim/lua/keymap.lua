-- harpoon
vim.api.nvim_set_keymap('n', '<Leader>.', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>;', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
-- lua dev
vim.api.nvim_set_keymap('n', '<Leader>x', ':luafile %<CR>', { noremap = true, silent = true })
--Telescope
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-F6>', ':IncRename ', { noremap = true, silent = true })
-- lsp
vim.api.nvim_set_keymap('n', '<C-b>', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
