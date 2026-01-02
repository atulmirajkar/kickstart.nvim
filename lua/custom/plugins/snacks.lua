local M = {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
}

M.config = function()
  require('snacks').setup {
    image = {
      enabled = true,
    },
  }
end
return M
