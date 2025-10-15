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
        "lua_ls",
        "bacon_ls",
      },
      -- Auto-install servers when opening relevant files
      automatic_installation = true,
    })
    
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter  
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
      },
      -- Auto-install tools
      auto_update = false,
      run_on_start = true, -- Install missing tools when Mason loads
    })
  end,
}
