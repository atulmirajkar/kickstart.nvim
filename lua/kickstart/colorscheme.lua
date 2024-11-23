local M = {
  'rebelot/kanagawa.nvim',
  -- "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.cmd.colorscheme 'kanagawa'
  -- vim.cmd.colorscheme 'tokyonight-storm'
end

return M
