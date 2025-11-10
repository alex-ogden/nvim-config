return {
  "caglartoklu/borlandp.vim",
  lazy = false,
  priority = 1000,
  config = function()
    --vim.cmd.colorscheme("borlandp") -- Changing to built-in colourscheme for now 
    vim.g.borlandp_bg = "dark_blue"
    vim.cmd("colo borlandp")
  end,
}
