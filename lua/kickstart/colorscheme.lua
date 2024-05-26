local M = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    -- vim.cmd.colorscheme 'onedark'
    -- vim.cmd.colorscheme 'catppuccin'
    vim.cmd.colorscheme 'tokyonight-moon'
end

return M
