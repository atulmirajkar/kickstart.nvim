local M = {
  'rebelot/kanagawa.nvim',
  -- 'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.cmd.colorscheme 'onedark'
  vim.cmd.colorscheme 'kanagawa'
end

return M
