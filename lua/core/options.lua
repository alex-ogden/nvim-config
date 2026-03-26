local opt = vim.opt

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Backspace
opt.backspace = "indent,eol,start"

-- --- CLIPBOARD (WSL FIX) ---
opt.clipboard:append("unnamedplus")

-- If you are on WSL, this tells Neovim to use the Windows clipboard specifically
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
        paste = { ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard))", ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard))" },
        cache_enabled = 0,
    }
end

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Swap and backup
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- --- PERFORMANCE & STABILITY ---
-- DELETED: opt.lazyredraw = false (This is deprecated/buggy in modern Neovim with Lua)
opt.shada = "'100,<50,s10,:100" -- Remember more history/registers

-- Mouse & UI
opt.mouse = "a"
opt.showmode = false
opt.laststatus = 3 -- Global statusline (modern look)
