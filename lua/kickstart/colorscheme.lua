local M = {
  -- 'folke/tokyonight.nvim',
  -- 'sainnhe/gruvbox-material',
  -- 'olimorris/onedarkpro.nvim',
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.cmd.colorscheme 'tokyonight-storm'
  -- vim.cmd.colorscheme 'gruvbox-material'
  -- vim.cmd.colorscheme 'onedark'
  require('onedark').setup {
    style = 'dark',
    -- style = 'light',
  }
  require('onedark').load()
end

return M
