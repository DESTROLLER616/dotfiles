return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				signcolumn = "yes",
			},
			renderer = {
				group_empty = true,
				highlight_git = "all",
				highlight_opened_files = "icon",
				root_folder_label = "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),

				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " " },
				},
				icons = {
					git_placement = "before",
					show = { file = true, folder = true, folder_arrow = false, git = true },
					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "󰉋",
							open = "󰉖",
							empty = "",
							empty_open = "",
						},
						git = {
							unstaged = "󰞋",
							staged = "󰄵",
							untracked = "󰎔",
							deleted = "󰛉",
							ignored = "󰛑",
							unmerged = "",
							renamed = "󰁔",
						},
					},
				},
			},
			update_focused_file = { enable = true },
			diagnostics = { enable = true, show_on_dirs = true },
		})

		local hl = vim.api.nvim_set_hl
		hl(0, "NvimTreeWinSeparator", { fg = "#313244", bg = "NONE" })
		hl(0, "NvimTreeGitDirty", { fg = "#f9e2af", bg = "NONE" })
		hl(0, "NvimTreeGitStaged", { fg = "#a6e3a1", bg = "NONE" })
		hl(0, "NvimTreeGitNew", { fg = "#89b4fa", bg = "NONE" })
	end,
}
