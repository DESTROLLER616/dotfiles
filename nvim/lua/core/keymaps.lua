local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Code necessary to add controls to error lens in code
map("n", "gl", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- Code necessary in Nvim tabs, their are commands to move
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previus tab" })
vim.keymap.set("n", "<leader>x", "<cmd>bp|bd #<cr>", { desc = "Cerrar pestaña" })
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
