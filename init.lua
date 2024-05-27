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
-- Spec("kickstart.debug")
Spec("kickstart.vimsleuth")
Spec("kickstart.mini")
-- -- Git related plugins
-- 'tpope/vim-fugitive',
-- 'tpope/vim-rhubarb',

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        -- Brief aside: **What is LSP?**
        --
        -- LSP is an initialism you've probably heard, but might not understand what it is.
        --
        -- LSP stands for Language Server Protocol. It's a protocol that helps editors
        -- and language tooling communicate in a standardized fashion.
        --
        -- In general, you have a "server" which is some tool built to understand a particular
        -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
        -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
        -- processes that communicate with some "client" - in this case, Neovim!
        --
        -- LSP provides Neovim with features like:
        --  - Go to definition
        --  - Find references
        --  - Autocompletion
        --  - Symbol Search
        --  - and more!
        --
        -- Thus, Language Servers are external tools that must be installed separately from
        -- Neovim. This is where `mason` and related plugins come into play.
        --
        -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
        -- and elegantly composed help section, `:help lsp-vs-treesitter`

        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        lazypath,
    }
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = PluginSpec
})
