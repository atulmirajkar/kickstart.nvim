return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons"},
	config = function()
		local nvimtree = require("nvim-tree")
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1


		nvimtree.setup({
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 30,
				side = "left",
				-- mappings = {
				-- 	list = {
				-- 		{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				-- 		{ key = "h",                  cb = tree_cb "close_node" },
				-- 		{ key = "v",                  cb = tree_cb "vsplit" },
				-- 	},
				-- },
			},
		})
		-- set keymaps
		local keymap = vim
			.keymap -- for conciseness

		keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
	end
}
