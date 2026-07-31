-- flash.nvim: label-based motion. Type `s` + 2 chars, then a label jumps you
-- anywhere on screen. Also enhances f/t/F/T and adds treesitter node selection.
-- Self-keyed and lazy — zero startup cost.
-- NOTE: `s` overrides the built-in substitute-char; use `cl` for that instead.
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle flash search" },
    },
  },
}
