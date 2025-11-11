# Ultimate Neovim Development Configuration

A lean, fast, and feature-rich Neovim configuration optimized for C/C++, Rust, Python, Zig, Bash/Shell, Terraform/HCL, Markdown, JSON, and YAML development.

## Features

- **Language Support**: Full LSP support for C/C++, Rust, Python, Zig, Bash, Terraform, and more
- **Auto-completion**: Intelligent code completion with nvim-cmp
- **Syntax Highlighting**: Advanced syntax highlighting with Treesitter
- **Auto-formatting**: Automatic formatting on save
- **File Navigation**: Telescope for fuzzy finding files and searching code
- **File Explorer**: nvim-tree for project navigation
- **Terminal**: Integrated terminal with toggleterm
- **Git Integration**: Visual git status and hunks with gitsigns
- **Clean UI**: Enhanced UI with noice.nvim and lualine
- **Retro Theme**: Cyberdream cyberpunk-inspired colorscheme

## Installation

1. Backup your existing config (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Install required dependencies:

   **macOS:**
   ```bash
   brew install neovim ripgrep fd node python
   # Formatters
   brew install clang-format rustfmt black isort stylua shfmt prettier
   ```

   **Linux (Ubuntu/Debian):**
   ```bash
   sudo apt install neovim ripgrep fd-find nodejs python3-pip
   # Formatters
   pip install black isort
   npm install -g prettier
   ```

3. Launch Neovim:
   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins on first launch. Wait for it to complete.

4. Install LSP servers:
   ```vim
   :Mason
   ```
   All required language servers will be automatically installed.

## Key Bindings

**Leader key: `Space`**

### General
- `jk` - Exit insert mode
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit all without saving
- `<leader>nh` - Clear search highlights

### File Navigation (Telescope)
- `<leader>ff` - Find files
- `<leader>fr` - Find recent files
- `<leader>fs` - Search string in project (ripgrep)
- `<leader>fc` - Find string under cursor
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags

### File Explorer (nvim-tree)
- `<leader>ee` - Toggle file explorer
- `<leader>ef` - Toggle file explorer on current file
- `<leader>ec` - Collapse file explorer
- `<leader>er` - Refresh file explorer

### Terminal (toggleterm)
- `<leader>tt` - Toggle terminal
- `<leader>th` - Toggle horizontal terminal
- `<leader>tv` - Toggle vertical terminal
- `<leader>tf` - Toggle floating terminal
- `<Esc>` or `jk` - Exit terminal mode

### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split
- `<C-h/j/k/l>` - Navigate between windows

### Buffer Management
- `<Tab>` - Next buffer
- `<Shift-Tab>` - Previous buffer
- `<leader>bd` - Delete buffer

### LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gt` - Go to type definition
- `gR` - Show references
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>d` - Show line diagnostics
- `<leader>D` - Show buffer diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>rs` - Restart LSP

### Formatting
- `<leader>mp` - Format file/range

### Git (gitsigns)
- `]c` - Next git hunk
- `[c` - Previous git hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hS` - Stage buffer
- `<leader>hR` - Reset buffer
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>tb` - Toggle line blame

### Comments
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment (in visual mode)

## Colorscheme

The default colorscheme is **Cyberdream**, a retro cyberpunk theme. Alternative retro themes are available in `lua/plugins/colorscheme.lua` - simply uncomment the one you want to try.

## Language-Specific Notes

### C/C++
- Uses `clangd` for LSP
- Formatted with `clang-format`

### Rust
- Uses `rust-analyzer` with clippy integration
- Formatted with `rustfmt`

### Python
- Uses `pyright` for LSP
- Formatted with `black` and `isort`

### Zig
- Uses `zls` for LSP
- Formatted with `zigfmt`

### Terraform
- Uses `terraformls` for LSP
- Formatted with `terraform fmt`

## Customization

All configuration files are in `~/.config/nvim/lua/`:
- `core/options.lua` - Vim options
- `core/keymaps.lua` - General keymaps
- `plugins/` - Individual plugin configurations

## Troubleshooting

**LSP not working:**
1. Run `:Mason` and ensure language servers are installed
2. Run `:LspInfo` to check LSP status
3. Run `:LspRestart` to restart the LSP

**Formatters not working:**
1. Ensure formatters are installed (see Installation section)
2. Check `:ConformInfo` for formatter status

**Telescope not finding files:**
- Ensure `ripgrep` and `fd` are installed

## Performance

This configuration is optimized for speed:
- Lazy loading of plugins
- Disabled unnecessary builtin plugins
- Optimized Treesitter parsers
- Fast file search with Telescope

Typical startup time: <50ms

Enjoy your new Neovim setup!
