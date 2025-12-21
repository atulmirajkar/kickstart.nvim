local M = {
  -- 'rebelot/kanagawa.nvim',
  -- "folke/tokyonight.nvim",
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.cmd.colorscheme 'kanagawa'
  -- vim.cmd.colorscheme 'tokyonight-storm'
  vim.cmd.colorscheme 'gruvbox-material'
end

return M
