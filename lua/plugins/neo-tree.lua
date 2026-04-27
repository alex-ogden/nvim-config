return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show filtered (hidden) files
        hide_dotfiles = false, -- show dotfiles
        hide_gitignored = false, -- show gitignored files (optional)
      },
    },
  },
}
