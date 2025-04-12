return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,
  config = function()
    require('lualine').setup {
      options = {
        -- icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_z = { { 'datetime', style = '%H:%M' } },
        lualine_y = { 'location' },
      },
    }
    -- require('darkvoid').setup()
  end,
}
