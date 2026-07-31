-- nvim-treesitter (main branch — the post-rewrite default, requires Neovim 0.12+).
--
-- On `main` there is no `configs.setup{ensure_installed=..., highlight=...}`.
-- Instead: install parsers with require("nvim-treesitter").install{...} and turn
-- on highlighting per-buffer with vim.treesitter.start() (now Neovim-native).
local parsers = {
  "lua", "vim", "vimdoc", "query",
  "bash", "rust", "c", "cpp",
  "terraform", "hcl", "dockerfile",
  "yaml", "json", "toml", "markdown", "markdown_inline",
  "gitcommit", "gitignore", "diff",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false, -- highlighting should be available from the first buffer
    config = function()
      -- Install any parsers not yet present (async; no-op if already installed).
      require("nvim-treesitter").install(parsers)

      -- Enable Treesitter highlighting + indentation for the relevant filetypes.
      -- Note: these are *filetypes* (sh/help), which map to the parser names above.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
        pattern = {
          "lua", "vim", "help", "query",
          "sh", "bash", "rust", "c", "cpp",
          "terraform", "hcl", "dockerfile",
          "yaml", "json", "jsonc", "toml", "markdown",
          -- (jsonc filetype uses the json parser on the main branch)
          "gitcommit", "gitignore", "diff",
        },
        callback = function()
          -- Syntax highlighting via Treesitter
          pcall(vim.treesitter.start)
          -- Treesitter-based indentation (experimental but handy)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
