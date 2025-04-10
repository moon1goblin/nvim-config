return {
	{
		"neovim/nvim-lspconfig",
		dependencies =  {
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
			},
		},
		config = function()
			-- FIXME: does not work yet lol
			-- also i wanna install blink.cmp
			-- vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
			-- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			-- vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
			-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			-- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
			-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		end,
	}
}
