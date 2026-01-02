-- https://stackoverflow.com/questions/76533194/neovim-github-copilot-notsignedin-but-authenticated
-- use above solution to signout
local M = {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
}

M.config = function()
  require('copilot').setup {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<M-y>',
        dismiss = '<M-e>',
        accept_word = false,
        accept_line = false,
        next = '<M-]>',
        prev = '<M-[>',
      },
    },
  }
end

return M
