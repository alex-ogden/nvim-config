-- mini.pairs: auto-close brackets/quotes as you type.
-- Chosen over nvim-autopairs because this config uses blink.cmp (nvim-autopairs'
-- main selling point is nvim-cmp integration, which doesn't apply here). blink
-- already inserts function-call brackets on completion; mini.pairs just handles
-- the plain `(` -> `()` typing case. Dependency-free, loads on first insert.
return {
  {
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },
}
