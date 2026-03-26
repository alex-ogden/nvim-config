return {
  "nvim-treesitter/nvim-treesitter",
  -- Add this line to fix the "module not found" error
  branch = "master", 
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- This line now works because we are on the 'master' branch
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "c",
        "cpp",
        "rust",
        "python",
        "zig",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "terraform",
        "hcl",
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
