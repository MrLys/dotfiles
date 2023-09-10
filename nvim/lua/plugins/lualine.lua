return   {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = {
        theme = function() require('lualine.themes.horizon') end
    }
}
