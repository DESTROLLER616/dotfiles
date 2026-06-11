return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				signcolumn = "yes", -- Espacio obligatorio para que aparezcan los iconos de Git
			},
			renderer = {
				group_empty = true,
				highlight_git = "all", -- Pinta todo el nombre del archivo con el color de Git
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
						-- Iconos de Git de alta visibilidad
						git = {
							unstaged = "󰞋", -- Círculo si está modificado
							staged = "󰄵", -- Check si está en staging
							untracked = "󰎔", -- Icono de archivo nuevo
							deleted = "󰛉", -- Eliminado
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

		-- Forzar colores correctos de Git sobre la transparencia de Ghostty
		local hl = vim.api.nvim_set_hl
		hl(0, "NvimTreeWinSeparator", { fg = "#313244", bg = "NONE" }) -- Línea divisoria
		hl(0, "NvimTreeGitDirty", { fg = "#f9e2af", bg = "NONE" }) -- Modificados (Amarillo)
		hl(0, "NvimTreeGitStaged", { fg = "#a6e3a1", bg = "NONE" }) -- Staged (Verde)
		hl(0, "NvimTreeGitNew", { fg = "#89b4fa", bg = "NONE" }) -- Nuevos (Azul)
	end,
}
