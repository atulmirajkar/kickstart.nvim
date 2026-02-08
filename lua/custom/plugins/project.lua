local M = {
  'ahmedkhalf/project.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
}

M.config = function()
  require('project_nvim').setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  require('telescope').load_extension 'projects'
  vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects, { desc = '[S]earch [P]roject' })
end
return M
