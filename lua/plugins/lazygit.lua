-- lazygit.nvim: opens the `lazygit` TUI in a floating window.
-- The heavy lifting is a compiled Go binary (installed via Homebrew), so the
-- Lua wrapper is tiny and lazy-loads on the commands/keys below — near-zero
-- startup cost. Pairs with gitsigns (gitsigns = in-buffer hunks; lazygit =
-- repo-wide staging / commit / branch / rebase / stash).
return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- only used for the float border
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazygit (repo root)" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<CR>", desc = "Lazygit (current file's repo)" },
    },
  },
}
