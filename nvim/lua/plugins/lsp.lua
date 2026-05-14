require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "marksman", "astro", "vue_ls", "ts_ls" },
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.config("marksman", {})
vim.lsp.config("astro", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("vue_ls", {
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("astro")
vim.lsp.enable("ts_ls")
vim.lsp.enable("vue_ls")

-- Import capabilities to add autocomplete in code
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("astro", { capabilities = capabilities })
vim.lsp.config("ts_ls", { capabilities = capabilities })
vim.lsp.config("vue_ls", {
	capabilities = capabilities,
	init_options = { vue = { hybridMode = false } },
})
