-- fzf-lua: fuzzy finder — file-name search AND ripgrep live-grep.
-- Requires the `fzf` and `rg` binaries (both present on this machine).
return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    keys = {
      -- File-name finding
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files (by name)" },
      { "<leader><space>", function() require("fzf-lua").files() end, desc = "Find files (by name)" },
      { "<leader>fg", function() require("fzf-lua").git_files() end, desc = "Find git-tracked files" },
      { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },

      -- Ripgrep / content search
      { "<leader>fw", function() require("fzf-lua").live_grep() end, desc = "Live grep (ripgrep)" },
      { "<leader>/", function() require("fzf-lua").live_grep() end, desc = "Live grep (ripgrep)" },
      { "<leader>fc", function() require("fzf-lua").grep_cword() end, desc = "Grep word under cursor" },
      { "<leader>fc", function() require("fzf-lua").grep_visual() end, mode = "v", desc = "Grep selection" },
      { "<leader>fl", function() require("fzf-lua").blines() end, desc = "Grep current buffer lines" },

      -- Misc pickers
      { "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Help tags" },
      { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
      { "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Document diagnostics" },
      { "<leader>fD", function() require("fzf-lua").diagnostics_workspace() end, desc = "Workspace diagnostics" },
      { "<leader>fR", function() require("fzf-lua").resume() end, desc = "Resume last picker" },
    },
    opts = {
      "default", -- base profile
      winopts = {
        height = 0.85,
        width = 0.85,
        preview = { layout = "flex" },
      },
      keymap = {
        -- Make fzf feel native inside the popup
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept", -- send all matches to the quickfix list
        },
      },
      files = {
        -- Respect .gitignore but still show hidden files (dotfiles)
        rg_opts = "--color=never --hidden --files -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      grep = {
        -- Live-grep backend flags for ripgrep
        rg_opts = "--column --line-number --no-heading --color=always --smart-case "
          .. "--max-columns=4096 --hidden -g '!.git'",
      },
    },
  },
}
