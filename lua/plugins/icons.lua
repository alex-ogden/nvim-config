-- nvim-web-devicons: filetype icons used by neo-tree, fzf-lua, lualine, etc.
-- Requires a Nerd Font to be set in your terminal to render correctly.
return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- loaded on demand by the plugins that depend on it
    opts = {},
  },
}
