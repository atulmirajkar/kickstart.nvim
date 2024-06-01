--inspired from https://github.com/LunarVim/Launch.nvim/blob/master/lua/user/launch.lua
PluginSpec = {}

function Spec(item)
    table.insert(PluginSpec, { import = item })
end

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
require "custom.core.options"
require "custom.core.keymaps"
require "custom.core.autocmds"
Spec("custom.plugins.autopairs")
Spec("custom.plugins.markdown-preview")
Spec("custom.plugins.obsidian")
Spec("custom.plugins.toggleterm")
Spec("custom.plugins.nvimtree")
Spec("custom.plugins.fugitive")
Spec("custom.plugins.copilot")
Spec("custom.plugins.copilot-lualine")
Spec("custom.plugins.copilot-chat")
--kickstart
Spec("kickstart.devicons")
Spec("kickstart.colorscheme")
Spec("kickstart.cmp")
Spec("kickstart.lualine")
Spec("kickstart.whichkey")
Spec("kickstart.gitsigns")
Spec("kickstart.telescope")
Spec("kickstart.treesitter")
Spec("kickstart.lspconfig")
Spec("kickstart.indentline")
Spec("kickstart.comment")
Spec("kickstart.autoformat")
-- Spec("kickstart.debug") -- getting some error with dap
Spec("kickstart.vimsleuth")
Spec("kickstart.mini")
-- -- Git related plugins

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = PluginSpec
})
