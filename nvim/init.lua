-- Import custom files
vim.g.mapleader = " "

require("user.options")
require("core.vim")
require("config.lazy") -- 👈 Dejamos que Lazy sea el único rey de los plugins
require("core.keymaps")

require("nvim-tree").setup()
