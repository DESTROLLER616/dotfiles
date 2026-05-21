return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Basic setup
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
			},
		})

		-- Set command to open/close file explorer
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Explorer" })
	end,
}
