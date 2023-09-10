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

require('lazy').setup({

     'mbbill/undotree',

     {"jackmort/chatgpt.nvim",
         dependencies = {
             "muniftanjim/nui.nvim",
             "nvim-lua/plenary.nvim",
             "nvim-telescope/telescope.nvim"
         }
     },

     {"debugloop/telescope-undo.nvim",
         dependencies = { "nvim-telescope/telescope.nvim" }
     },

     'theprimeagen/harpoon',
     'kylechui/nvim-surround',

     'nvim-lua/plenary.nvim',
     "nvim-treesitter/nvim-treesitter",
    -- git
     'tpope/vim-fugitive',

     {
         "nvim-telescope/telescope.nvim", tag = "0.1.0",
         dependencies = { {"nvim-lua/plenary.nvim"} }
     },

     {
         'rose-pine/neovim',
         name = 'rose-pine'
     },
     'andrewferrier/debugprint.nvim',

     { "catppuccin/nvim", name = "catppuccin" },
     -- lsp
     {
         'VonHeikemen/lsp-zero.nvim',
         dependencies = {
             -- LSP Support
             {'neovim/nvim-lspconfig'},
             {'williamboman/mason.nvim'},
             {'williamboman/mason-lspconfig.nvim'},

             -- Autocompletion
             {'hrsh7th/nvim-cmp'},
             {'hrsh7th/cmp-buffer'},
             {'hrsh7th/cmp-path'},
             {'saadparwaiz1/cmp_luasnip'},
             {'hrsh7th/cmp-nvim-lsp'},
             {'hrsh7th/cmp-nvim-lua'},

             -- Snippets
             {'L3MON4D3/LuaSnip'},
             {'rafamadriz/friendly-snippets'},
         }
     },
     {"erichdongubler/lsp_lines.nvim"}
 })

