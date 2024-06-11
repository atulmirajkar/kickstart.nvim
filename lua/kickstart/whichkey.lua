local M = {
    'folke/which-key.nvim'
}
M.config = function()
    -- document existing key chains
    require('which-key').register {
        ['<leader>q'] = { "<cmd>confirm q<CR>", "[Q]uit" },
        ['<leader>hl'] = { "<cmd>nohlsearch<CR>", "NO[HL]" },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]it', _ = 'which_key_ignore' },
        ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>a'] = { name = '[A]I', _ = 'which_key_ignore' }
    }
end
return M
