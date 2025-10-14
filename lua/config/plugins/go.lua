if vim.fn.executable("go") == 0 then
  return {}
end

return {
  {
    "fatih/vim-go",
    ft = { "go", "gomod" },
    build = ":GoInstallBinaries",
  },
}
