-- Configuración de Diagnósticos (Ese texto que avisa de errores)
vim.diagnostic.config({
	virtual_text = true, -- Show error in end of line
	signs = true, -- Show icons in left row
	update_in_insert = false, -- No disturb while typing
	underline = true, -- Underline word that has error
	severity_sort = true, -- Sort by importance
	float = {
		border = "rounded", -- Floating windows with shape borders
		source = "always", -- Show which LSP gives error
	},
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Define patters to locate extension files
local patterns = {
	"lua",
	"markdown",
	"javascript",
	"typescript",
}

-- Option to set tab indent in code files
vim.api.nvim_create_autocmd("FileType", {
	pattern = patterns,
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
