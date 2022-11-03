require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "h", action = "split" },
				{ key = "C", action = "cd" },
				{ key = "v", action = "vsplit" },
				{ key = ".", action = "toggle_dotfiles" },
				{ key = "i", action = "toggle_ignored" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	git = {
		ignore = false, -- Show ignored files
	},
})
