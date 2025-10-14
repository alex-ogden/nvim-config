return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { 
    "NvimTreeToggle", 
    "NvimTreeOpen", 
    "NvimTreeClose", 
    "NvimTreeFocus",
    "NvimTreeFindFileToggle",
    "NvimTreeCollapse",
    "NvimTreeRefresh"
  },
  keys = {
    { "<leader>e",  "", desc = "Nvim Tree" },
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    -- These settings need to be set before nvim-tree loads
    -- Moving them to init ensures they're set at startup
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    local nvimtree = require("nvim-tree")
    
    nvimtree.setup({
      view = {
        width = 50,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
  end,
}
