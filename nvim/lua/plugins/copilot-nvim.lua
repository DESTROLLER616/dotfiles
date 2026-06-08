return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot", -- Solo carga el plugin si ejecutas el comando :Copilot
	event = "InsertEnter", -- O se carga automáticamente en cuanto empiezas a escribir texto
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true, -- Te muestra sugerencias automáticamente al escribir
				debounce = 75,
				keymap = {
					accept = "<M-l>", -- Presiona Alt + l para aceptar la sugerencia de la IA
					accept_word = "<M-w>", -- Presiona Alt + w para aceptar solo la siguiente palabra
					accept_line = "<M-a>", -- Presiona Alt + a para aceptar solo la siguiente línea
					next = "<M-]>", -- Alt + ] para ir a la siguiente sugerencia si hay varias
					prev = "<M-[>", -- Alt + [ para ir a la sugerencia anterior
					dismiss = "<C-]>", -- Ctrl + ] para ocultar la sugerencia actual
				},
			},
			panel = { enabled = false },
		})
	end,
}
