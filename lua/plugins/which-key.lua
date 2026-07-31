-- which-key.nvim: shows a popup of possible key bindings after a prefix
-- (e.g. after pressing <leader>). Automatically lists any mapping that has a
-- `desc`, so all the descriptions set elsewhere in this config show up here.
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300, -- ms after a prefix before the popup appears
      -- Group labels for the leader prefixes used across this config.
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "diagnostics" },
        { "<leader>f", group = "find / fuzzy" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "git hunks" },
        { "<leader>i", group = "inlay hints" },
        { "<leader>n", group = "noice / notifications" },
        { "<leader>r", group = "rename / refactor" },
        { "<leader>t", group = "terminal" },
        { "<leader>w", group = "window / write" },
        { "<leader>x", group = "trouble / lists" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer-local keymaps (which-key)",
      },
    },
  },
}
