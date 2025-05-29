local map = require('langmapper').map

-- basic keymaps
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("i", "jk", "<ESC>")

-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 7
-- tab width
vim.opt.tabstop=4
vim.opt.shiftwidth=4

-- update time (im not sure what it does lol)
vim.opt.updatetime = 100
-- keymap wait time
vim.opt.timeoutlen = 200

-- clipboard synchronisation with the os
vim.opt.clipboard = "unnamedplus"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- clear highlight of search
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- case-insensitive searching unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight when yanking (stolen from tj xd)
vim.api.nvim_create_autocmd('TextYankPost', {
  -- desc = 'Highlight when yanking (copying) text',
  -- group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- remove those ~ at end of buffer
vim.opt.fillchars:append 'eob: '

-- show diagnostic messages from lsps
vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

-- switching between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- toggle diagnostics
vim.g['diagnostics_active'] = true
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
	print("[lsp diagonstics] off")
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
	print("[lsp diagonstics] on")
  end
end
map('n', '<leader>d', Toggle_diagnostics, { noremap = true, silent = true, desc = 'Toggle vim diagnostics' })
