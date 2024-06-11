local M = {
	"zbirenbaum/copilot.lua",
	branch = "canary",
	event = "InsertEnter",
}

M.config = function()
	local opts = { noremap = true, silent = true, desc = "Toggle Copilot" }
	vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
	require('copilot').setup({
		filetypes = {
			markdown = true,
		},
		-- suggestion = { enabled = false },
		-- panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = false,
			debounce = 75,
			keymap = {
				accept = "<M-y>",
				dismiss = "<M-e>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
			}
		}
	})
end

return M
