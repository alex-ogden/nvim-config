return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm", -- options: lightning, storm, moon, night
			transparent = true, -- optional: makes the background match your terminal
			styles = {
				-- This is the "Joined Up" magic for Victor Mono
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = { italic = false },
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "tokyonight",
				component_separators = "|",
				section_separators = { left = "", right = "" }, -- Nerd Font icons
			},
		},
	},
}
