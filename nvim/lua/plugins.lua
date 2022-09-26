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
    -- Also run code after load (see the 'config' key)
    --use {
    --    'w0rp/ale',
    --    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex', 'lua'},
    --    cmd = 'ALEEnable',
    --    config = 'vim.cmd[[ALEEnable]]'
    --}
    use {'smartpde/debuglog'}
    -- Plugins can also depend on rocks from luarocks.org:
    use {
	'/home/ljos/project/budzilla',
	rocks = {'lpeg', 'http', 'lua-cjson'}
    }
    -- Plugins can also depend on rocks from luarocks.org:
    -- use('hrsh7th/cmp-nvim-lsp')
    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks 'lpeg'
    use_rocks 'http'
    use_rocks 'lua-cjson'

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {
	'theprimeagen/harpoon',
	requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use('nvim-lua/lsp_extensions.nvim')
        -- Completion
    -- Sources
    use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-document-symbol'
    use 'tamago324/cmp-zsh'
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'simrat39/symbols-outline.nvim'
    --luasnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'p00f/nvim-ts-rainbow'


    -- Comparators
    use 'lukas-reineke/cmp-under-comparator'


    use('tzachar/cmp-tabnine', { run = './install.sh' })
    -- Use dependency and run lua function after load
    use {
	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
	config = function() require('gitsigns').setup() end
    }
   -- use {'stevearc/dressing.nvim',
   -- config = function()
   --     require('dressing').setup()
   -- end,
   -- }

    use {
    'smjonas/inc-rename.nvim',
    config = function()
	require('inc_rename').setup()
	end,
}

use { 'catppuccin/nvim', as = 'catppuccin' }
if packer_bootstrap then
    require('packer').sync()
end

end)


