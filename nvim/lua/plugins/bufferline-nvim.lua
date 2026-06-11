return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	event = "VeryLazy",
	config = function()
		local status_ok, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
		local highlights = {}
		if status_ok then
			highlights = catppuccin_bufferline.get()
		end

		require("bufferline").setup({
			options = {
				mode = "buffers",
				style_preset = require("bufferline").style_preset.default,
				indicator = { style = "icon", icon = "▎" },
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",

				-- INTEGRACIÓN CON NVIM-TREE
				offsets = {
					{
						filetype = "NvimTree",
						text = "File explorer",
						text_align = "center",
						separator = true, -- Línea divisoria vertical para el fondo transparente
						highlight = "NvimTreeNormal", -- Fuerza a bufferline a usar la transparencia de nvim-tree
					},
				},

				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = false,
				always_show_bufferline = true,
			},
			highlights = highlights,
		})
	end,
}
