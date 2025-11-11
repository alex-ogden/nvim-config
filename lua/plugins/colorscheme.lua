return {
	-- Primary colorscheme: Cyberdream (cyberpunk retro)
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = false,
				italic_comments = true,
				hide_fillchars = false,
				borderless_telescope = false,
				terminal_colors = true,
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},

	-- Alternative retro themes (disabled by default)
	-- Uncomment to try different retro aesthetics

	-- Retrobox: Classic retro colors
	-- {
	--   "eddyekofo94/gruvbox-flat.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     vim.cmd("colorscheme gruvbox-flat")
	--   end,
	-- },

	-- Synthwave 84: Vaporwave/80s aesthetic
	-- {
	--   "samharju/synthweave.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     vim.cmd("colorscheme synthweave")
	--   end,
	-- },

	-- Borland-style theme
	-- {
	-- 	"ray-x/starry.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme limestone") -- Borland-like color scheme
	-- 	end,
	-- },
}
