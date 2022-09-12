-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- package.path = package.path .. ";/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;"
-- package.path = package.path .. ";/home/thomas/projects"
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
local use_rocks = require('packer').use_rocks
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'lua'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use {"smartpde/debuglog"}
  -- Plugins can also depend on rocks from luarocks.org:
  use {
    '/home/thomas/projects/budzilla',
    rocks = {'lpeg', 'http', 'lua-cjson'}
  }
  -- Plugins can also depend on rocks from luarocks.org:
  -- use("hrsh7th/cmp-nvim-lsp")
  -- You can specify rocks in isolation
  use_rocks 'penlight'

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use {
  'theprimeagen/harpoon',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use("nvim-lua/lsp_extensions.nvim")
  use("glepnir/lspsaga.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("tzachar/cmp-tabnine", { run = "./install.sh" })
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use {'stevearc/dressing.nvim',
  config = function()
	  require('dressing').setup()
  end,
  }

  use {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
}

  use { "catppuccin/nvim", as = "catppuccin" }
  if packer_bootstrap then
    require('packer').sync()
  end

end)


