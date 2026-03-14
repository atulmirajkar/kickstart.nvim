local M = {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.g.mkdp_images_path = '/Users/atulmirajkar/Work/markdown-notes/'
    vim.g.mkdp_images_path_as_root = 1
  end,
}

return M
