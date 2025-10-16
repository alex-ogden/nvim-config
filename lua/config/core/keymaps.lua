vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>p", "", { desc = "Lazy plugin manager" })
keymap.set("n", "<leader>pp", ":Lazy<CR>", { desc = "Lazy plugin manager" })
keymap.set("n", "<leader>pi", ":Lazy install<CR>", { desc = "Install outstanding plugins" })
keymap.set("n", "<leader>pu", ":Lazy update<CR>", { desc = "Update outstanding plugins" })
keymap.set("n", "<leader>pc", ":Lazy clean<CR>", { desc = "Clean outstanding plugins" })
keymap.set("n", "<leader>ps", ":Lazy sync<CR>", { desc = "Sync (Install, Update and Clean) plugins" })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- Terminal
keymap.set("n", "<leader>t", "", { desc = "Terminal" })
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- window management
keymap.set("n", "<leader>s", "", { desc = "Window Management" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
