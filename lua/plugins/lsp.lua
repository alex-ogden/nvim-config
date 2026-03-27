return {
    -- Mason: LSP installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    -- Mason LSP Config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",       -- C/C++
                    "rust_analyzer",-- Rust
                    "pyright",      -- Python
                    "zls",          -- Zig
                    "lua_ls",       -- Lua
                    "bashls",       -- Bash
                    "terraformls",  -- Terraform
                    "jsonls",       -- JSON
                    "yamlls",       -- YAML
                    "marksman",     -- Markdown
                    "gopls",        -- Go language server
                },
                automatic_installation = true,
            })
        end,
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }

                -- LSP keybindings
                vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
            })

            local default_config = {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            -- Go
            vim.lsp.config("gopls", vim.tbl_extend("force", default_config, {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                        },
                        staticcheck = true,
                    },
                },
            }))
            vim.lsp.enable("gopls")

            -- C/C++
            vim.lsp.config("clangd", vim.tbl_extend("force", default_config, {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                },
            }))
            vim.lsp.enable("clangd")

            -- Rust
            vim.lsp.config("rust_analyzer", vim.tbl_extend("force", default_config, {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = { command = "clippy" },
                    },
                },
            }))
            vim.lsp.enable("rust_analyzer")

            -- Python
            vim.lsp.config("pyright", vim.tbl_extend("force", default_config, {
                settings = { python = { analysis = { typeCheckingMode = "basic" } } },
            }))
            vim.lsp.enable("pyright")

            -- Zig
            vim.lsp.config("zls", default_config)
            vim.lsp.enable("zls")

            -- Bash
            vim.lsp.config("bashls", default_config)
            vim.lsp.enable("bashls")

            -- Terraform
            vim.lsp.config("terraformls", default_config)
            vim.lsp.enable("terraformls")

            -- JSON
            vim.lsp.config("jsonls", default_config)
            vim.lsp.enable("jsonls")

            -- YAML
            vim.lsp.config("yamlls", vim.tbl_extend("force", default_config, {
                settings = {
                    yaml = { schemas = { ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*" } },
                },
            }))
            vim.lsp.enable("yamlls")

            -- Markdown
            vim.lsp.config("marksman", default_config)
            vim.lsp.enable("marksman")

            -- Lua
            vim.lsp.config("lua_ls", vim.tbl_extend("force", default_config, {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            }))
            vim.lsp.enable("lua_ls")
        end,
    },
}
