-- nvim-surround: add/change/delete surrounding pairs (quotes, brackets, tags).
--   ysiw)  surround inner word with ()
--   cs'"   change surrounding ' to "
--   ds]    delete surrounding ]
-- Dot-repeatable and treesitter/HTML-tag aware. Loads on VeryLazy so it costs
-- nothing at startup but its operator maps are ready before you need them.
return {
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },
}
