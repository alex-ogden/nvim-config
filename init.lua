-- ~/.config/nvim/init.lua
-- Entry point. Load order matters: leader must be set before lazy.nvim,
-- and core settings load before plugins.

-- Leader keys (must come before plugins are loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Provider trimming for faster startup (we don't use these language hosts)
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Core editor configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap lazy.nvim (the plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin specs from lua/plugins/
require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = true, notify = false }, -- check for plugin updates in the background
	change_detection = { notify = false },
	performance = {
		rtp = {
			-- disable some built-in plugins we don't need, for faster startup
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"netrwPlugin", -- replaced by neo-tree
			},
		},
	},
})
