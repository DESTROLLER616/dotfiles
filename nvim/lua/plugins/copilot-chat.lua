return {
	-- Autocomplete of Copilot chat
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = "<M-w>",
						accept_line = "<M-a>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},

	-- Copilot chat interface, require the previous plugin to work
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle menu" },
			{
				"<leader>cx",
				"<cmd>CopilotChatExplain<cr>",
				mode = "v",
				desc = "CopilotChat - Explain selected code",
			},

			{
				"<leader>ci",
				function()
					local input = vim.fn.input("What code do you need to add?: ")
					if input ~= "" then
						local prompt = input
							.. " (Genera SOLO el código correspondiente, sin introducciones ni explicaciones de texto, formateado plano)"
						require("CopilotChat").ask(prompt, {
							selection = require("CopilotChat.select").buffer,
							callback = function(response)
								local lines = {}
								for _, line in ipairs(vim.split(response, "\n")) do
									if not line:match("^```") then
										table.insert(lines, line)
									end
								end
								local row, _ = table.unpack(vim.api.nvim_win_get_cursor(0))
								vim.api.nvim_buf_set_lines(0, row, row, false, lines)
							end,
						})
					end
				end,
				desc = "CopilotChat - Add code to the file",
			},
		},
	},
}
