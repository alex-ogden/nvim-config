-- conform.nvim: format-on-save with per-filetype formatters.
-- Falls back to the LSP formatter when no dedicated formatter is configured.
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = { "n", "v" },
        desc = "Format buffer / selection",
      },
    },
    opts = {
      formatters_by_ft = {
        lua        = { "stylua" },
        rust       = { "rustfmt" },
        c          = { "clang-format" },
        cpp        = { "clang-format" },
        sh         = { "shfmt" },
        bash       = { "shfmt" },
        terraform  = { "terraform_fmt" },
        hcl        = { "terraform_fmt" },
        json       = { "jq" },
        jsonc      = { "jq" },
        yaml       = { "prettier" },
        markdown   = { "prettier" },
        -- dockerfile: no canonical formatter; lsp_format="fallback" no-ops cleanly.
      },
      format_on_save = function(bufnr)
        -- Allow disabling autoformat per-buffer or globally via variables.
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    },
    init = function()
      -- Commands to toggle format-on-save at runtime.
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true -- current buffer only
        else
          vim.g.disable_autoformat = true -- global
        end
      end, { desc = "Disable format-on-save", bang = true })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Re-enable format-on-save" })
    end,
  },
}
