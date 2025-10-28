local M = {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
}

M.config = function()
  local opts = { noremap = true, silent = true, desc = 'Toggle [a]uto trigger Copilot' }

  -- Set keymap for toggling auto trigger
  vim.api.nvim_set_keymap('n', '<leader>aa', ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

  -- Setup Copilot with configuration
  local success, copilot = pcall(require, 'copilot')
  if not success then
    vim.notify('Failed to load Copilot', vim.log.levels.ERROR)
    return
  end

  copilot.setup {
    filetypes = {
      markdown = true,
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
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

-- write a function to close buffers in current window
function close_buffers()
  local current_window = vim.api.nvim_get_current_win()
  local current_buffer = vim.api.nvim_win_get_buf(current_window)
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if buffer ~= current_buffer then
      vim.api.nvim_buf_delete(buffer, { force = true })
    end
  end
end

return M
