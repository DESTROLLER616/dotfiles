return {
	"echasnovski/mini.animate",
	version = false, -- Usa la última versión de desarrollo
	event = "VeryLazy",
	config = function()
		require("mini.animate").setup({
			-- Smooth scroll animation
			cursor = { enable = true },
			-- Animation when scrolling
			scroll = { enable = true },
			-- Animation when opening or closing split windows
			window = { enable = true },
			-- Animation when resizing windows
			resize = { enable = true },
		})
	end,
}
