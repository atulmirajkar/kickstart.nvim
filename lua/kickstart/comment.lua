local M = {
    'numToStr/Comment.nvim',
    dependencies = {
        'folke/todo-comments.nvim',
        'nvim-lua/plenary.nvim'
    },
    opts = {},
}
M.config = function()
    require('todo-comments').setup {
        signs = false
    }
end
return M
