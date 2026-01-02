local M = {
  'folke/which-key.nvim',
}
M.config = function()
  require('which-key').add {
    { '<leader>q', '<cmd>confirm q<CR>', desc = '[Q]uit' },
    { '<leader>hl', '<cmd>nohlsearch<CR>', desc = 'NO{HL]' },

    { '<leader>g', group = '[G]it' },
    { '<leader>g_', hidden = true },

    { '<leader>h', group = '[H]it' },
    { '<leader>h_', hidden = true },

    { '<leader>l', group = '[L]SP' },
    { '<leader>l_', hidden = true },

    { '<leader>s', group = '[S]earch' },
    { '<leader>s_', hidden = true },

    { '<leader>a', group = '[A]I' },
    { '<leader>a_', hidden = true },

    { '<leader>b', group = '[B]uffer' },
    { '<leader>b_', hidden = true },

    { '<leader>o', group = '[O]bsidian' },
    { '<leader>o_', hidden = true },
  }
end
return M
