-- inspired from https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/extras/copilot-chat-v2.lua
local M = {
  'CopilotC-Nvim/CopilotChat.nvim',
  branch = 'canary',
  dependencies = {
    { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper}
  },
  event = 'VeryLazy',
}

M.config = function()
  require('CopilotChat').setup {
    -- Use unnamed register for the selection
    selection = require('CopilotChat.select').unnamed,
    question_header = '## User ',
    answer_header = '## Copilot ',
    error_header = '## Error ',
    prompts = {
      -- Code related prompts
      Explain = 'Please explain how the following code works.',
      Review = 'Please review the following code and provide suggestions for improvement.',
      Tests = 'Please explain how the selected code works, then generate unit tests for it.',
      Refactor = 'Please refactor the following code to improve its clarity and readability.',
      FixCode = 'Please fix the following code to make it work as intended.',
      FixError = 'Please explain the error in the following text and provide a solution.',
      BetterNamings = 'Please provide better names for the following variables and functions.',
      Documentation = 'Please provide documentation for the following code.',
      SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.',
      SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.',
      -- Text related prompts
      Summarize = 'Please summarize the following text.',
      Spelling = 'Please correct any grammar and spelling errors in the following text.',
      Wording = 'Please improve the grammar and wording of the following text.',
      Concise = 'Please rewrite the following text to make it more concise.',
      -- Override the git prompts message
      Commit = {
        prompt = 'Write commit message for the change with commitizen convention',
        selection = require('CopilotChat.select').gitdiff,
      },
      CommitStaged = {
        prompt = 'Write commit message for the change with commitizen convention',
        selection = function(source)
          return require('CopilotChat.select').gitdiff(source, true)
        end,
      },
    },
    auto_follow_cursor = true, -- Don't follow the cursor after getting response
    show_help = false, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
    mappings = {
      -- Use tab for completion
      complete = {
        insert = '',
      },
      -- Close the chat
      close = {
        normal = 'q',
        insert = '<C-c>',
      },
      -- Reset the chat buffer
      reset = {
        normal = '<C-x>',
        insert = '<C-x>',
      },
      -- Submit the prompt to Copilot
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-CR>',
      },
      -- Accept the diff
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>',
      },
      -- Yank the diff in the response to register
      yank_diff = {
        normal = 'gmy',
      },
      -- Show the diff
      show_diff = {
        normal = 'gmd',
      },
      -- Show the prompt
      show_system_prompt = {
        normal = 'gmp',
      },
      -- Show the user selection
      show_user_selection = {
        normal = 'gms',
      },
    },
  }

  local chat = require 'CopilotChat'
  local select = require 'CopilotChat.select'

  -- Setup the CMP integration
  require('CopilotChat.integrations.cmp').setup()

  vim.api.nvim_create_user_command('CopilotChatVisual', function(args)
    chat.ask(args.args, { selection = select.visual })
  end, { nargs = '*', range = true })

  -- Inline chat with Copilot
  vim.api.nvim_create_user_command('CopilotChatInline', function(args)
    chat.ask(args.args, {
      selection = select.visual,
      window = {
        layout = 'float',
        relative = 'cursor',
        width = 1,
        height = 0.4,
        row = 1,
      },
    })
  end, { nargs = '*', range = true })

  -- Restore CopilotChatBuffer
  vim.api.nvim_create_user_command('CopilotChatBuffer', function(args)
    chat.ask(args.args, { selection = select.buffer })
  end, { nargs = '*', range = true })

  -- Custom buffer for CopilotChat
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = 'copilot-*',
    callback = function()
      vim.opt_local.relativenumber = true
      vim.opt_local.number = true

      -- Get current filetype and set it to markdown if the current filetype is copilot-chat
      local ft = vim.bo.filetype
      if ft == 'copilot-chat' then
        -- update completion source for copilot-chat
        print 'loaded chat'
        local cmp = require 'cmp'
        cmp.setup.buffer {
          sources = {
            { name = 'copilot-chat' },
            { name = 'buffer' },
          },
        }

        -- change filetype to markdown
        vim.bo.filetype = 'markdown'
      end
    end,
  })

  -- normal mode maps
  local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { desc = desc })
  end

  -- visual mode maps
  local xmap = function(keys, func, desc)
    vim.keymap.set('x', keys, func, { desc = desc })
  end

  -- Show help actions with telescope
  nmap('<leader>ah', function()
    local actions = require 'CopilotChat.actions'
    require('CopilotChat.integrations.telescope').pick(actions.help_actions())
  end, 'CopilotChat - Help actions')
  -- Show prompts actions with telescope
  nmap('<leader>ap', function()
    local actions = require 'CopilotChat.actions'
    require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
  end, 'CopilotChat - Prompt actions')
  xmap(
    '<leader>ap',
    ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
    'CopilotChat - Prompt actions'
  )
  -- Code related commands
  nmap('<leader>ae', '<cmd>CopilotChatExplain<cr>', 'CopilotChat - Explain code')
  nmap('<leader>at', '<cmd>CopilotChatTests<cr>', 'CopilotChat - Generate tests')
  nmap('<leader>ar', '<cmd>CopilotChatReview<cr>', 'CopilotChat - Review code')
  nmap('<leader>aR', '<cmd>CopilotChatRefactor<cr>', 'CopilotChat - Refactor code')
  nmap('<leader>an', '<cmd>CopilotChatBetterNamings<cr>', 'CopilotChat - Better Naming')
  -- Chat with Copilot in visual mode
  xmap('<leader>av', ':CopilotChatVisual', 'CopilotChat - Open in vertical split')
  xmap('<leader>ax', ':CopilotChatInline<cr>', 'CopilotChat - Inline chat')
  -- Custom input for CopilotChat
  nmap('<leader>ai', function()
    local input = vim.fn.input 'Ask Copilot: '
    if input ~= '' then
      vim.cmd('CopilotChat ' .. input)
    end
  end, 'CopilotChat - Ask input')
  -- Generate commit message based on the git diff
  nmap('<leader>am', '<cmd>CopilotChatCommit<cr>', 'CopilotChat - Generate commit message for all changes')
  nmap('<leader>aM', '<cmd>CopilotChatCommitStaged<cr>', 'CopilotChat - Generate commit message for staged changes')
  -- Quick chat with Copilot
  nmap('<leader>aq', function()
    local input = vim.fn.input 'Quick Chat: '
    if input ~= '' then
      vim.cmd('CopilotChatBuffer ' .. input)
    end
  end, 'CopilotChat - Quick chat')
  -- Debug
  nmap('<leader>ad', '<cmd>CopilotChatDebugInfo<cr>', 'CopilotChat - Debug Info')
  -- Fix the issue with diagnostic
  nmap('<leader>af', '<cmd>CopilotChatFixDiagnostic<cr>', 'CopilotChat - Fix Diagnostic')
  -- Clear buffer and chat history
  nmap('<leader>ax', '<cmd>CopilotChatReset<cr>', 'CopilotChat - Clear buffer and chat history')
  -- Toggle Copilot Chat Vsplit
  nmap('<leader>av', '<cmd>CopilotChatToggle<cr>', 'CopilotChat - Toggle')
  -- copilot chat integration
  require('CopilotChat.integrations.cmp').setup()
end

return M
