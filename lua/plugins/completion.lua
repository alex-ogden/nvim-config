-- blink.cmp: completion engine (modern default over nvim-cmp for 2026 configs).
-- Prebuilt Rust fuzzy-matcher binaries are downloaded automatically for the
-- pinned `1.*` tag, so no `cargo build` step is needed.
return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    -- Build the Rust fuzzy matcher from source. The prebuilt binary download
    -- can misdetect the platform (it fetched x86_64 on this arm64 Mac), so we
    -- compile natively with the installed cargo toolchain instead.
    build = "cargo build --release",
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default", -- <C-y> accept, <C-n>/<C-p> or arrows to select, <C-e> hide
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 250 },
        menu = { border = "rounded" },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
