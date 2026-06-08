return {
	-- 1. CONFIGURACIÓN BASE DE COPILOT (Autocompletado)
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true, -- Muestra sugerencias tenues al escribir
					debounce = 75,
					keymap = {
						accept = "<M-l>", -- Alt + l para aceptar la sugerencia completa
						accept_word = "<M-w>", -- Alt + w para aceptar solo la siguiente palabra
						accept_line = "<M-a>", -- Alt + a para aceptar solo la siguiente línea
						next = "<M-]>", -- Alt + ] para ver la siguiente sugerencia
						prev = "<M-[>", -- Alt + [ para ver la sugerencia anterior
						dismiss = "<C-]>", -- Ctrl + ] para ocultar la sugerencia
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	-- 2. CONFIGURACIÓN DE COPILOT CHAT (Agente e Inyección de código)
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- Depende del plugin de arriba
			{ "nvim-lua/plenary.nvim" }, -- Librería de utilidades requerida
		},
		opts = {
			debug = false,
		},
		keys = {
			-- <leader>cc -> Abre o cierra el panel de chat a la derecha
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Alternar Copilot Chat" },

			-- <leader>cx -> (En modo Visual) Selecciona código y pide que lo explique
			{
				"<leader>cx",
				"<cmd>CopilotChatExplain<cr>",
				mode = "v",
				desc = "CopilotChat - Explicar código seleccionado",
			},

			-- <leader>ci -> Pide código a la IA y lo inyecta directamente bajo el cursor
			{
				"<leader>ci",
				function()
					local input = vim.fn.input("¿Qué código quieres agregar?: ")
					if input ~= "" then
						-- Forzamos a la IA a responder estrictamente con código limpio
						local prompt = input
							.. " (Genera SOLO el código correspondiente, sin introducciones ni explicaciones de texto, formateado plano)"
						require("CopilotChat").ask(prompt, {
							selection = require("CopilotChat.select").buffer,
							callback = function(response)
								-- Limpieza básica de bloques de código markdown (```) si la IA los incluye
								local lines = {}
								for _, line in ipairs(vim.split(response, "\n")) do
									if not line:match("^```") then
										table.insert(lines, line)
									end
								end
								-- USAMOS table.unpack PARA EVITAR EL WARNING EN LUA 5.4
								local row, _ = table.unpack(vim.api.nvim_win_get_cursor(0))
								vim.api.nvim_buf_set_lines(0, row, row, false, lines)
							end,
						})
					end
				end,
				desc = "CopilotChat - Agregar código directamente al archivo",
			},
		},
	},
}
