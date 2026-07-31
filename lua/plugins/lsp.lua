-- LSP: mason (installer) + mason-lspconfig (bridge) + nvim-lspconfig (server defs).
--
-- Neovim 0.11+/0.12 native flow:
--   * mason-lspconfig v2 auto-runs vim.lsp.enable() for installed servers
--     (automatic_enable = true, the default). `setup_handlers` no longer exists.
--   * Per-server settings go through vim.lsp.config('name', {...}).
--   * Completion capabilities are merged once via the '*' wildcard config.
return {
  -- Mason: manages external LSP servers / tools
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts = {
      ui = { border = "rounded" },
    },
  },

  -- Auto-install formatters/tools that aren't LSP servers (used by conform).
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "stylua",       -- Lua formatter
        "shfmt",        -- shell formatter
        "prettier",     -- yaml/markdown formatter
        -- rustfmt ships with the Rust toolchain; clang-format with clang; jq via brew.
      },
      run_on_start = true,
    },
  },

  -- Bridge Mason <-> lspconfig, and drive install + enable
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = {
        "lua_ls",       -- Lua (this config)
        "rust_analyzer",-- Rust
        "clangd",       -- C / C++
        "bashls",       -- Bash / shell
        "terraformls",  -- Terraform
        "dockerls",     -- Dockerfile
        "yamlls",       -- YAML
        "jsonls",       -- JSON
      },
      automatic_enable = true, -- auto vim.lsp.enable() every installed server
    },
    config = function(_, opts)
      -----------------------------------------------------------------------
      -- 1. Diagnostics UI
      -----------------------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = { spacing = 2, prefix = "●" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = true },
      })

      -----------------------------------------------------------------------
      -- 2. Global capabilities (wire blink.cmp completion into every server)
      -----------------------------------------------------------------------
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -----------------------------------------------------------------------
      -- 3. Per-server settings (merged on top of the '*' defaults)
      -----------------------------------------------------------------------
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME }, -- know about the `vim` global
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            keyOrdering = false,
            schemaStore = { enable = true },
          },
        },
      })

      -----------------------------------------------------------------------
      -- 4. Buffer-local keymaps when a server attaches
      -----------------------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_keymaps", { clear = true }),
        callback = function(event)
          local function map(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", function() require("fzf-lua").lsp_references() end, "References")
          map("gi", function() require("fzf-lua").lsp_implementations() end, "Implementations")
          map("gy", function() require("fzf-lua").lsp_typedefs() end, "Type definitions")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ds", function() require("fzf-lua").lsp_document_symbols() end, "Document symbols")
          map("<leader>ws", function() require("fzf-lua").lsp_live_workspace_symbols() end, "Workspace symbols")

          -- Inlay hints toggle (if the server supports them)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            map("<leader>ih", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "Toggle inlay hints")
          end
        end,
      })

      -----------------------------------------------------------------------
      -- 5. Hand opts to mason-lspconfig (triggers install + automatic_enable)
      -----------------------------------------------------------------------
      require("mason-lspconfig").setup(opts)
    end,
  },
}
