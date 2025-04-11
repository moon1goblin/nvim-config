-- pop-up todo list 
-- little custom plugin thing that somehow works?
-- btw most of the code is not mine lol
local buf, win
local function popup_todo_list()
  buf = vim.api.nvim_create_buf(false, false)

  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  local width = vim.api.nvim_get_option 'columns'
  local height = vim.api.nvim_get_option 'lines'

  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = 'rounded',
  }

  win = vim.api.nvim_open_win(buf, true, opts)

  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_option(0, 'filetype', 'markdown')
  vim.api.nvim_buf_set_option(0, 'modifiable', true)
  -- vim.cmd(":edit catalog.txt")
  -- return a list of the file(s) in the runtime path
  -- corresponding to the pattern given as first argument,
  -- false means "return only the first one found":
  local file_path = '/Users/ivan/Yandex.Disk.localized/ObsidianVault/todo.md'
  -- execute a command, "read" insert the given file above the cursor:
  vim.api.nvim_buf_set_name(buf, file_path)
  vim.api.nvim_buf_call(buf, vim.cmd.edit)
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  end
  vim.cmd 'norm G$'
end

vim.keymap.set('n', '<leader>td', popup_todo_list, { noremap = true, desc = '[T]o [D]o list' })
