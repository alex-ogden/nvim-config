return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = true,
  cmd = {
    "Telescope",
    "TodoTelescope",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 
      "nvim-telescope/telescope-fzf-native.nvim", 
      build = "make",
      lazy = true,
    },
    "nvim-tree/nvim-web-devicons",
    {
      "folke/todo-comments.nvim",
      lazy = true,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    
    -- Lazy load trouble integration only when needed
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        local trouble = require("trouble")
        trouble.toggle("quickfix")
      end,
    })
    
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = function(prompt_bufnr)
              -- Lazy load trouble telescope integration
              local trouble_telescope = require("trouble.sources.telescope")
              trouble_telescope.open(prompt_bufnr)
            end,
          },
        },
      },
    })
    
    telescope.load_extension("fzf")
  end,
}
