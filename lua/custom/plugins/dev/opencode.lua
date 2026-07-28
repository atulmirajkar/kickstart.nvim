local M = {
  dir = '~/Work/neovimcode/opencode.nvim', -- Use local path for development
  -- 'atulmirajkar/opencode.nvim',
  dependencies = {
    { 'folke/snacks.nvim', opts = { input = {} } },
  },
}
M.config = function()
  vim.g.opencode_opts = {
    provider = {
      enabled = 'tmux',
      tmux = {
        options = '-h -l 35%', -- Split 35% vertically
        focus = false, -- keep focus in nvim
      },
    },
  }

  -- Required for opts.events.reload
  vim.o.autoread = true

  -- Test keymaps
  vim.keymap.set({ 'n', 'x' }, '<leader>ai', function()
    require('opencode').ask('@this: ', { submit = true })
  end, { desc = 'Ask opencode…' })
  vim.keymap.set({ 'n', 'x' }, '<leader>ap', function()
    require('opencode').select()
  end, { desc = 'Execute opencode action…' })
  vim.keymap.set({ 'n', 't' }, '<leader>at', function()
    require('opencode').toggle()
  end, { desc = 'Toggle opencode' })
  vim.keymap.set({ 'n', 'x' }, '<leader>ag', function()
    return require('opencode').operator '@this '
  end, { desc = 'Add range to opencode', expr = true })
  vim.keymap.set('n', '<leader>ac', function()
    require('opencode').cleanup()
  end, { desc = 'Cleanup opencode session' })
  vim.keymap.set('n', '<leader>aa', function()
    require('opencode').attach()
  end, { desc = 'Attach to opencode' })
end
return M
