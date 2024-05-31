local M = {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependecies = {
        'nvim-tree/nvim-web-devicons',
        "AndreM222/copilot-lualine",
    }
}

M.config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '',
        },
        sections = {
            lualine_x = { 'copilot', 'filetype' },
        }
    }
end


return M
