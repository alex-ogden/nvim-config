return {
	-- Auto-install formatters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"clang-format", -- C/C++
					"cmakelang", -- CMake
					"black", -- Python
					"isort", -- Python
					"stylua", -- Lua
					"shfmt", -- Bash/Shell
					"prettier", -- JSON/YAML/Markdown
					"zls", -- Zig
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},

	-- Formatting plugin
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					c = { "clang_format" },
					cpp = { "clang_format" },
					cmake = { "cmakelang" },
					rust = { "rustfmt" },
					python = { "isort", "black" },
					zig = { "zig fmt" },
					lua = { "stylua" },
					bash = { "shfmt" },
					sh = { "shfmt" },
					terraform = { "terraform_fmt" },
					tf = { "terraform_fmt" },
					hcl = { "terraform_fmt" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})

			-- Keymap for manual formatting
			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
