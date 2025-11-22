return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<leader>tt]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
			},
		})

		-- Keymaps
		local keymap = vim.keymap

		-- Terminal mode mappings
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- Additional terminal keybindings
		keymap.set(
			"n",
			"<leader>th",
			"<cmd>ToggleTerm size=20 direction=horizontal<cr>",
			{ desc = "Toggle horizontal terminal" }
		)
		keymap.set(
			"n",
			"<leader>tv",
			"<cmd>ToggleTerm size=80 direction=vertical<cr>",
			{ desc = "Toggle vertical terminal" }
		)
		keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
	end,
}
