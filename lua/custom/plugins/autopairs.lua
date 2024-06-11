local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
}

M.config = function()
	require("nvim-autopairs").setup({
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
	})
end
return M
