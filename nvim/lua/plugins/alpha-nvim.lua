return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			'            .-"""-.          ',
			"           '       \\         ",
			"          |,.  ,-.  |        ",
			"          |()L( ()| |        ",
			"          |,'  `\".| |        ",
			"          |.___.',| `        ",
			"         .j `--\"' `  `.      ",
			"        / '        '   \\     ",
			"       / /          `   `.   ",
			"      / /            `    .  ",
			"     / /              l   |  ",
			"    . ,               |   |  ",
			'    ,".`              .|   | ',
			" _.'   ``.          | `..-'l ",
			"|        `.`,        |      `.",
			"|          `.    __.j          )",
			'|__        |--""___|      ,-\'  ',
			'   `"--...,+""""   `._,.-\' mh_ ',
		}
		-- Assign new buttons to execute commands
		dashboard.section.buttons.val = {
			dashboard.button("e", "  Nuevo Archivo", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  Buscar Archivo", ":Telescope find_files <CR>"),
			dashboard.button("r", "󰄉  Archivos Recientes", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "󰅚  Salir", ":qa<CR>"),
		}

		-- Custom footer text
		dashboard.section.footer.val = "⚡ Neovim 0.12 levantado con éxito"

		-- Setup adjusts
		alpha.setup(dashboard.opts)
	end,
}
