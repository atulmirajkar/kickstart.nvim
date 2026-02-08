local M = {
  -- 'folke/tokyonight.nvim',
  -- 'sainnhe/gruvbox-material',
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.cmd.colorscheme 'tokyonight-storm'
  -- vim.cmd.colorscheme 'gruvbox-material'
  vim.cmd.colorscheme 'onedark'
end

return M
