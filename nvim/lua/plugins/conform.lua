-- Install confort plugin to activate formatter
require("conform").setup({
	formatters_by_ft = {
		markdown = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
