return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = false,
				italic_comments = true,
				hide_fillchars = false,
				borderless_telescope = true,
				terminal_colors = true,
			})
			vim.cmd("colo darkblue")
		end,
	},
	-- {
	-- 	"eddyekofo94/gruvbox-flat.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox-flat")
	-- 	end,
	-- },
	-- {
	-- 	"samharju/synthweave.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme synthweave")
	-- 	end,
	-- },
	-- {
	-- 	"ray-x/starry.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme limestone")
	-- 	end,
	-- },
}
