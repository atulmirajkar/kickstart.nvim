local M = {
	"zbirenbaum/copilot.lua",
	branch = "canary",
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
}

M.config = function()
	local opts = { noremap = true, silent = true, desc = "Toggle Copilot" }
	vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
	require('copilot').setup({
		filetypes = {
			markdown = true,
		},
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
	require('copilot_cmp').setup({})
end

return M
