local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Code necessary to add controls to error lens in code
map("n", "gl", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

-- Code necessary in Nvim tabs, their are commands to move
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previus tab" })
map("n", "<leader>x", "<cmd>bp|bd #<cr>", { desc = "Close tab" })
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Get out to terminal mode" })
map("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move tab to the left" })
map("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move tab to the right" })

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
