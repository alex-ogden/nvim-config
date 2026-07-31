-- neo-tree.nvim: file tree explorer
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorer (toggle)" },
      { "<leader>o", "<cmd>Neotree focus<CR>", desc = "Explorer (focus)" },
      { "<leader>ge", "<cmd>Neotree git_status<CR>", desc = "Explorer: git status" },
    },
    opts = {
      close_if_last_window = true, -- don't leave an empty tree as the only window
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true }, -- reveal the current file in the tree
        use_libuv_file_watcher = true,            -- OS-level watchers instead of polling (fast)
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 32,
        mappings = {
          ["<space>"] = "none",       -- keep <space> free for the leader key
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["H"] = "toggle_hidden",
        },
      },
      default_component_configs = {
        indent = { with_expanders = true },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },
}
