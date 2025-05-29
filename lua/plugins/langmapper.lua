-- TODO: remap everything with this, so far i only did options.lua but fuck it
return {
  'Wansmer/langmapper.nvim',
  lazy = false,
  priority = 1, -- High priority is needed if you will use `autoremap()`
  config = function()
    require('langmapper').setup({--[[ your config ]]})
  end,
}
