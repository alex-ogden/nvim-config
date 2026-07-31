-- Editor options
-- See `:help vim.opt` and `:help option-list`

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4        -- a <Tab> counts for 4 spaces
opt.shiftwidth = 4     -- size of an indent
opt.expandtab = true   -- use spaces instead of tabs
opt.smartindent = true -- smart autoindenting on new lines
opt.autoindent = true

-- Search
opt.ignorecase = true -- ignore case in search patterns...
opt.smartcase = true  -- ...unless the pattern contains an uppercase letter
opt.hlsearch = true   -- highlight matches
opt.incsearch = true  -- show matches as you type

-- UI
opt.termguicolors = true  -- 24-bit RGB colors (required by most themes)
opt.signcolumn = "yes"    -- always show the sign column, avoids layout shift
opt.cursorline = true     -- highlight the current line
opt.scrolloff = 8         -- keep 8 lines visible above/below the cursor
opt.sidescrolloff = 8
opt.wrap = false          -- don't wrap long lines
opt.showmode = false      -- mode is shown in the statusline instead
opt.splitright = true     -- vertical splits open to the right
opt.splitbelow = true     -- horizontal splits open below
opt.pumheight = 10        -- max items in the completion popup

-- Behaviour
opt.mouse = "a"                    -- enable mouse in all modes
opt.clipboard = "unnamedplus"      -- use the system clipboard
opt.undofile = true                -- persistent undo across sessions
opt.swapfile = false
opt.backup = false
opt.updatetime = 250               -- faster CursorHold events (diagnostics, gitsigns)
opt.timeoutlen = 400               -- time to wait for a mapped sequence
opt.confirm = true                 -- prompt to save instead of failing on :q

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Whitespace rendering
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live substitution preview
opt.inccommand = "split"
