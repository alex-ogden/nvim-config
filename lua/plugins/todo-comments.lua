-- todo-comments.nvim: highlight and search TODO / FIX / HACK / BUG / PERF / NOTE
-- comments. Integrates with fzf-lua (:TodoFzfLua) and trouble.nvim (:Trouble todo),
-- both present in this config. ripgrep (already installed) powers the search.
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Find todo comments" },
      { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Todo comments (Trouble)" },
    },
    opts = {},
  },
}
