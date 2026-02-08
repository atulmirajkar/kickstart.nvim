local M = {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {},
}
M.config = function()
  require('render-markdown').setup {
    completions = { lsp = { enabled = true } },
    bullet = {
      right_pad = 1,
    },
  }
end
return M
