-- basic keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("i", "jk", "<ESC>")

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
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- toggle diagnostics
vim.g['diagnostics_active'] = true
function Toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    -- vim.diagnostic.disable()
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end
vim.keymap.set('n', '<leader>d', Toggle_diagnostics, { noremap = true, silent = true, desc = 'Toggle vim diagnostics' })
