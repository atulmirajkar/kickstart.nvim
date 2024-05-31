local M = {
    'lewis6991/gitsigns.nvim',
    lazy = false
}

M.config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup {
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        on_attach = function(bufnr)
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal { ']c', bang = true }
                else
                    gitsigns.next_hunk()
                end
            end, { desc = 'Jump to next git [c]hange' })

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal { '[c', bang = true }
                else
                    gitsigns.prev_hunk()
                end
            end, { desc = 'Jump to previous git [c]hange' })

            -- Actions
            -- visual mode
            map('v', '<leader>gs', function()
                gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end, { desc = '[g]it [s]tage hunk' })
            map('v', '<leader>gr', function()
                gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
            end, { desc = '[g]it reset hunk' })
            -- normal mode
            map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[g]it [s]tage hunk' })
            map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[g]it [r]eset hunk' })
            map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[g]it [S]tage buffer' })
            map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[g]it [u]ndo stage hunk' })
            map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[g]it [R]eset buffer' })
            map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[g]it [p]review hunk' })
            map('n', '<leader>gb', gitsigns.blame_line, { desc = '[g]it [b]lame line' })
            map('n', '<leader>gd', gitsigns.diffthis, { desc = '[g]it [d]iff against index' })
            map('n', '<leader>gD', function()
                gitsigns.diffthis('@')
            end, { desc = '[g]it [D]iff against last commit' })
            -- Toggles
            map('n', '<leader>hb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git show [b]lame line' })
            map('n', '<leader>hD', gitsigns.toggle_deleted, { desc = 'Toggle git show [D]eleted' })

            -- experimental
            -- Text object
            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end,
    }
end

-- test
return M
