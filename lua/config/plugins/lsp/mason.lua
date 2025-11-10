return {
  "williamboman/mason.nvim",
  lazy = true,
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = true,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim", 
      lazy = true,
    },
  },
  config = function()
    -- import mason
    local mason = require("mason")
    -- import mason-lspconfig  
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    
    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜", 
          package_uninstalled = "✗",
        },
      },
    })
    
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",          -- Lua
        "rust_analyzer",   -- Rust (modern alternative to bacon_ls)
        "clangd",          -- C++
        "basedpyright",    -- Python (faster than pyright)
        "terraformls",     -- Terraform
        "yamlls",          -- YAML
        "jsonls",          -- JSON
      },
      -- Auto-install servers when opening relevant files
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "prettier",        -- JSON, YAML
        "stylua",          -- Lua
        "black",           -- Python
        "isort",           -- Python imports
        "clang-format",    -- C++
        "rustfmt",         -- Rust
        -- Linters
        "ruff",            -- Python (fast, modern linter/formatter)
        "tflint",          -- Terraform
      },
      -- Auto-install tools
      auto_update = false,
      run_on_start = true, -- Install missing tools when Mason loads
    })
  end,
}
