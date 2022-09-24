require("set")
require("plugins")
require("keymap")
require("mason").setup({
    ui = {
	icons = {
	    package_installed = "✓",
	    package_pending = "➜",
	    package_uninstalled = "✗"
	}
    }
})

vim.g.catppuccin_flavor = "macchiato"

require("catppuccin").setup({
    transparent_background = true,
    term_colors = false,
})
require("telescope").load_extension('harpoon')
require("debuglog").setup({})
vim.cmd [[colorscheme catppuccin]]
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua", "rust_analyzer"}
})
require("nvim-treesitter.configs").setup( {
    ensure_installed = {"lua"},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
	enable = true,
	disable = {},
	additional_vim_regex_highlighting = false,
    },
    rainbow = {
	enable = true,
	-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	max_file_lines = nil, -- Do not enable for files with more than n lines, int
	-- colors = {}, -- table of hex strings
	-- termcolors = {} -- table of colour name strings
    }
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp = require'cmp'
cmp.setup({
    snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	end,
    },
    window = {
	 completion = cmp.config.window.bordered(),
	 documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	--{ name = 'vsnip' }, -- For vsnip users.
	{ name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.
    }, {
	{ name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
	{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
	{ name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'path' }
    }, {
	{ name = 'cmdline' }
    })
})

-- Set up lspconfig.
local capabilities = 
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
	Lua = {
	    runtime = {
		-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		version = 'LuaJIT',
	    },
	    diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = {'vim'},
	    },
	    workspace = {
		-- Make the server aware of Neovim runtime files
		library = vim.api.nvim_get_runtime_file("", true),
	    },
	    -- Do not send telemetry data containing a randomized but unique identifier
	    telemetry = {
		enable = false,
	    },
	},
    },
}

