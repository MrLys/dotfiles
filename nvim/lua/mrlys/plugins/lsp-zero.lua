return {
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
	},
	config = function()
		local lsp = require("lsp-zero")
		require("lsp_lines").setup()

		vim.diagnostic.config({
			virtual_text = false,
		})
		lsp.preset("recommended")

		lsp.ensure_installed({
			'lua_ls',
			'rust_analyzer',
		})


		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] =  cmp.mapping.confirm({ select = true }),
			["<C-Space>"] =  cmp.mapping.complete(),
		})

		lsp.set_preferences({})

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings
		})

		lsp.on_attach( function( _, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc = 'Show workspace symbols', buffer = bufnr, remap = false})
            vim.keymap.set("n", "<leader>vd", function() require("lsp_lines").toggle() end, {desc = 'Toggle lsp lines', buffer = bufnr, remap = false})
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>l", function() vim.lsp.buf.code_action() end, {desc = 'Show code action', buffer = bufnr, remap = false})
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {desc = 'Show usage', buffer = bufnr, remap = false})
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc = 'Rename', buffer = bufnr, remap = false})
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		lsp.configure("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = {'vim'} -- why do i still need this?
					},
				}
			}
		})

		lsp.setup()
	end
}
