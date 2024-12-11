local M = {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependecies = {
    'nvim-tree/nvim-web-devicons',
    'AndreM222/copilot-lualine',
  },
}

M.config = function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      -- component_separators = '',
      -- section_spearators = '',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_x = { 'copilot', 'filetype' },
    },
  }
end

return M
