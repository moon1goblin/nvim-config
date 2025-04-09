-- basic keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("i", "jk", "<ESC>")

vim.opt.tabstop = 4

-- update time (faster completion i think)
vim.opt.updatetime = 10
-- keymap wait time
vim.opt.timeoutlen = 200

-- clipboard synchronisation with the os
vim.opt.clipboard = "unnamedplus"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true


-- clear highlight of search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', ';;', '<cmd>nohlsearch<CR>')

-- highlight when yanking (stolen from tj xd)
vim.api.nvim_create_autocmd('TextYankPost', {
  -- desc = 'Highlight when yanking (copying) text',
  -- group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
