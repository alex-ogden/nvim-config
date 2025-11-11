return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
    })

    -- Register key groups for better organization
    wk.add({
      { "<leader>f", group = "Find/Search" },
      { "<leader>e", group = "File Explorer" },
      { "<leader>t", group = "Terminal" },
      { "<leader>h", group = "Git Hunks" },
      { "<leader>s", group = "Split" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "Rename/Replace" },
      { "<leader>m", group = "Format" },
    })
  end,
}
