return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			variant = "auto",
			transparent = true,
			saturation = 1,
			italic_comments = true,
			hide_fillchars = true,
			borderless_pickers = true,
			cache = true,
		})
		vim.cmd.colorscheme("cyberdream")
	end,
}
