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
					"clangd", -- C/C++
					"rust_analyzer", -- Rust
					"pyright", -- Python
					"zls", -- Zig
					"lua_ls", -- Lua
					"bashls", -- Bash
					"terraformls", -- Terraform
					"jsonls", -- JSON
					"yamlls", -- YAML
					"marksman", -- Markdown
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

			-- LSP keybindings
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true }

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end

			-- Capabilities for autocompletion
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Diagnostic signs (Neovim 0.11+ API)
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

			-- Default config for all servers
			local default_config = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			-- Configure LSP servers using new Neovim 0.11 API

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

			-- Rust
			vim.lsp.config("rust_analyzer", vim.tbl_extend("force", default_config, {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			}))

			-- Python
			vim.lsp.config("pyright", vim.tbl_extend("force", default_config, {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
						},
					},
				},
			}))

			-- Zig
			vim.lsp.config("zls", default_config)

			-- Bash
			vim.lsp.config("bashls", default_config)

			-- Terraform
			vim.lsp.config("terraformls", default_config)

			-- JSON
			vim.lsp.config("jsonls", default_config)

			-- YAML
			vim.lsp.config("yamlls", vim.tbl_extend("force", default_config, {
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						},
					},
				},
			}))

			-- Markdown
			vim.lsp.config("marksman", default_config)

			-- Lua (for Neovim config)
			vim.lsp.config("lua_ls", vim.tbl_extend("force", default_config, {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			}))

			-- Enable LSP servers
			vim.lsp.enable("clangd")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("pyright")
			vim.lsp.enable("zls")
			vim.lsp.enable("bashls")
			vim.lsp.enable("terraformls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("yamlls")
			vim.lsp.enable("marksman")
			vim.lsp.enable("lua_ls")
		end,
	},
}
