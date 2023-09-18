return  {
     'theprimeagen/harpoon',
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        {"<leader>.", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon"},
        {"<leader>;", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks"},
        {"<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Navigate to first marked file"},
        {"<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Navigate to second marked file"},
        {"<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Navigate to third marked file"},
        {"<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Navigate to forth marked file"},
    }
}
