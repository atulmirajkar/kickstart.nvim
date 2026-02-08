local M = {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
}

M.config = function()
  local wk = require 'which-key'
  wk.add {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Explorer' },
  }

  local nvimtree = require 'nvim-tree'
  -- recommended settings from nvim-tree documentation
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  nvimtree.setup {
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    renderer = {
      root_folder_modifier = ':t',
      icons = {
        glyphs = {
          default = '',
          symlink = '',
          folder = {
            arrow_open = '',
            arrow_closed = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = 'S',
            unmerged = '',
            renamed = '➜',
            untracked = 'U',
            deleted = '',
            ignored = '◌',
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    view = {
      width = 30,
      side = 'left',
    },
    --
    -- copied from https://github.com/ahmedkhalf/project.nvim
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    filters = {
      dotfiles = true,
    },
  }
end
return M
