return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- CC display window settings
      window = {
        position = "botright",
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,

        -- float = {
        --   width = "75%",
        --   height = "75%",
        --   row = "center",
        --   col = "center",
        --   relative = "editor",
        --   border = "rounded",
        -- }
      },

      -- File refresh configuration
      refresh = {
        enable = true,
        updatetime = 100,
        timer_interval = 1000,
        show_notifications = true,
      },
      
      -- Shell-specific settings
      shell = {
        separator = '&&',        -- Command separator used in shell commands
        pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
        popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
      },

      -- Command settings
      command = "claude",
      command_variants = {
        -- Conversation management
        continue = "--continue",
        resume = "--resume",

        -- Output
        verbose = "--verbose",
      },

      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<leader>cc",       -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = "<leader>ct",     -- Terminal mode keymap for toggling Claude Code, false to disable
          variants = {
            continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
            verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
      }
    })
  end
}
