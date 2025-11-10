return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Target languages
        cpp = { "clang-format" },
        c = { "clang-format" },
        rust = { "rustfmt" },
        python = { "isort", "black" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
        json = { "prettier" },
        yaml = { "prettier" },
        -- Other useful languages
        lua = { "stylua" },
        markdown = { "prettier" },
      },
      -- something
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
