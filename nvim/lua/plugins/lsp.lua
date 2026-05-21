return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Init Mason to download executables in a visual window
		require("mason").setup()

		-- Capacity to autocomplete
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Locate Vue 3 plugin in Mason automatically
		local vue_plugin_path = require("mason-registry").get_package("vue-language-server"):get_install_path()
			.. "/node_modules/@vue/language-server"

		-- Config lsp servers and their behavior
		vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
		vim.lsp.config("marksman", {})
		vim.lsp.config("astro", { capabilities = capabilities })
		vim.lsp.config("tailwindcss", { capabilities = capabilities })
		vim.lsp.config("rust_analyzer", { capabilities = capabilities })
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			init_options = {
				plugins = {
					{
						-- Inyect support in Typescript to vue files
						name = "@vue/typescript-plugin",
						location = vue_plugin_path,
						languages = { "javascript", "typescript", "vue" },
					},
				},
			},
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		})
		vim.lsp.config("vue_ls", {
			capabilities = capabilities,
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
			filetypes = { "vue" },
		})

		-- Weak up servers
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("marksman")
		vim.lsp.enable("astro")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("vue_ls")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("rust_analyzer")
	end,
}
