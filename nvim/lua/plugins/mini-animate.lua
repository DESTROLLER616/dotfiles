return {
	"echasnovski/mini.animate",
	version = false, -- Usa la última versión de desarrollo
	event = "VeryLazy",
	config = function()
		require("mini.animate").setup({
			-- Animación suave al mover el cursor
			cursor = { enable = true },
			-- Animación al hacer scroll (subir/bajar)
			scroll = { enable = true },
			-- Animación al abrir o cerrar ventanas divididas
			window = { enable = true },
			-- Animación al redimensionar ventanas
			resize = { enable = true },
		})
	end,
}
