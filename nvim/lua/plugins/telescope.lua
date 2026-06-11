return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-smart-history.nvim",
		"kkharji/sqlite.lua", -- Requisito para guardar el historial en base de datos
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},

				sorting_strategy = "ascending", -- Los mejores resultados aparecen arriba del todo
				winblend = 0, -- Mantiene la opacidad perfecta sobre tu Ghostty transparente
				border = true,
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

				-- Símbolos limpios para el prompt
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "   ",

				-- 2. COMPORTAMIENTO INTELIGENTE
				-- Ignora archivos binarios, node_modules o carpetas de Git al buscar texto
				file_ignore_patterns = { "node_modules/", ".git/", "dist/", "build/", "%.ico", "%.png", "%.jpg" },
				path_display = { "truncate" }, -- Corta rutas larguísimas de forma elegante

				-- Historial de comandos integrado
				history = {
					path = vim.fn.stdpath("data") .. "/telescope_history.sqlite",
					limit = 100,
				},
			},

			-- 3. CONFIGURACIÓN DE EXTENSIONES
			extensions = {
				fzf = {
					fuzzy = true, -- Activación del buscador difuso nativo
					override_generic_sorter = true, -- Sobreescribe el buscador por defecto
					override_file_sorter = true, -- Sobreescribe el buscador de archivos
					case_mode = "smart_case", -- Ignora mayúsculas a menos que las escribas adrede
				},
			},
		})

		-- Cargar las extensiones de forma segura tras el inicio
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "smart_history")

		-- ADAPTACIÓN DE COLORES PARA GHOSTTY TRANSPARENTE
		-- Eliminamos los fondos sólidos de las cajas de Telescope para fundirse con la terminal
		local hl = vim.api.nvim_set_hl
		hl(0, "TelescopeBorder", { fg = "#313244", bg = "NONE" }) -- Bordes sutiles
		hl(0, "TelescopePromptBorder", { fg = "#89b4fa", bg = "NONE" }) -- Borde de escritura azul
		hl(0, "TelescopePromptPrefix", { fg = "#f38ba8", bg = "NONE" }) -- Lupa rosa
		hl(0, "TelescopeSelection", { fg = "#cdd6f4", bg = "#313244" }) -- Resaltado de la línea seleccionada
	end,
}
