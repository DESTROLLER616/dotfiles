return {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- Autocomplete and Snippets
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- Fuente para que cmp lea del LSP
	{ "L3MON4D3/LuaSnip" }, -- Motor de snippets (obligatorio para cmp)
	{ "saadparwaiz1/cmp_luasnip" },

	-- Formater
	{ "stevearc/conform.nvim", opts = {} },
}
