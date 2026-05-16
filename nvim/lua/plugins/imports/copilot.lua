return {
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Desactivar el autocompletado de texto fantasma al arrancar
			vim.g.copilot_enabled = true
			vim.g.copilot_no_tab_map = true
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			mode = "split",
			window = {
				layout = "vertical",
				width = 0.4, -- Ocupa el 40% de la pantalla a la derecha
			},
			show_help = true,
			question_header = "## Usuario ",
			answer_header = "## Copilot ",
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			local keymap = vim.keymap.set

			-- Atajos de teclado para controlar al agente
			keymap({ "n", "v" }, "<leader>gg", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
			keymap("n", "<leader>gr", "<cmd>CopilotChatReset<cr>", { desc = "Resetear Chat" })
			keymap("v", "<leader>ge", "<cmd>CopilotChatExplain<cr>", { desc = "Explicar código" })
			keymap("v", "<leader>gf", "<cmd>CopilotChatFix<cr>", { desc = "Corregir código" })
		end,
	},
}
