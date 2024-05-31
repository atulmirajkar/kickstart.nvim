local M = {
    'numToStr/Comment.nvim',
    dependencies = {
        'folke/todo-comments.nvim',
        'nvim-lua/plenary.nvim'
    },
    lazy = false,
}
M.config = function()
    require('Comment').setup{}
    require('todo-comments').setup {
        signs = false
    }
end
return M
