return {
  'dgox16/oldworld.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('oldworld')
    local oldworld = require("oldworld")

    oldworld.setup({
      terminal_colors = true,
      variant = "default",
    })
  end,
}
