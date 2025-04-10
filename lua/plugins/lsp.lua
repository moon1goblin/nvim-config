return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 
			"saghen/blink.cmp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- configures lua for me
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			}
		},

		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
					vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = event.buf, desc = '[G]oto [D]efinition'})
					vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = event.buf, desc = '[G]oto [R]eferences' })
					vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { buffer = event.buf, desc = '[G]oto [I]mplementation' })
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = '[R]e[n]ame' })
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[C]ode [A]ction' })
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = '[G]oto [D]eclaration' })
				end,
			})

			local my_servers = {
				lua_ls = {
					settings = {
						Lua = {
							-- completion = {
							-- 	callSnippet = 'Replace',
							-- },
							diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			},

			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = vim.tbl_keys(my_servers),
			}
			require("mason-lspconfig").setup()

			local lspconfig = require('lspconfig')

			for server, config in pairs(my_servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end
	}
}
