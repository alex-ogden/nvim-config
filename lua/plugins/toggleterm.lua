-- toggleterm.nvim: terminals that toggle into a bottom split, a side split,
-- or a floating window.
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      -- The default <C-\> toggles the last-used terminal in whatever
      -- direction it was opened.
      { [[<C-\>]], desc = "Toggle terminal" },
      { "<leader>tf", desc = "Terminal: float" },
      { "<leader>th", desc = "Terminal: horizontal (bottom)" },
      { "<leader>tv", desc = "Terminal: vertical (side)" },
    },
    opts = {
      -- <C-\> is the global toggle key. `size` is a function so horizontal
      -- and vertical terminals each get a sensible dimension.
      open_mapping = [[<C-\>]],
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      direction = "float", -- default direction for the global <C-\> toggle
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- Three dedicated terminals, each pinned to an orientation. Using
      -- distinct `count` values keeps them independent of one another.
      local float_term = Terminal:new({ direction = "float", count = 1, hidden = true })
      local horiz_term = Terminal:new({ direction = "horizontal", count = 2, hidden = true })
      local vert_term = Terminal:new({ direction = "vertical", count = 3, hidden = true })

      local map = vim.keymap.set
      map("n", "<leader>tf", function() float_term:toggle() end, { desc = "Terminal: float" })
      map("n", "<leader>th", function() horiz_term:toggle() end, { desc = "Terminal: horizontal (bottom)" })
      map("n", "<leader>tv", function() vert_term:toggle() end, { desc = "Terminal: vertical (side)" })

      -- Terminal-mode keymaps: make window navigation and escape ergonomic.
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          local o = { buffer = 0 }
          map("t", "<Esc>", [[<C-\><C-n>]], o)          -- leave terminal insert mode
          map("t", "jk", [[<C-\><C-n>]], o)
          map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
          map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
          map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
          map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
        end,
      })
    end,
  },
}
