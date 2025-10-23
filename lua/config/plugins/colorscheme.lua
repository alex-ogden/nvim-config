return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local cyberdream = require("cyberdream")

    cyberdream.setup({
      variant = "default",
      transparent = true,
      saturation = 1,
      italic_comments = true,
      hide_fillchars = true,
      borderless_pickers = true,
      terminal_colors = true,
      cache = true,
    })
    vim.cmd.colorscheme("cyberdream") -- Changing to built-in colourscheme for now 
  end,
}
