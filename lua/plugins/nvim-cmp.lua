return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",       -- source for text in buffer
    "hrsh7th/cmp-path",         -- source for file system paths
    "L3MON4D3/LuaSnip",         -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",     -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Define Go snippets
    luasnip.add_snippets("go", {
      -- func snippet
      luasnip.snippet("func", {
        luasnip.text_node("func "), 
        luasnip.insert_node(1, "name"),
        luasnip.text_node("("),
        luasnip.insert_node(2),
        luasnip.text_node(") "),
        luasnip.insert_node(3),
        luasnip.text_node({" {", "\t"}),
        luasnip.insert_node(0),
        luasnip.text_node({"", "}"}),
      }),
      -- if snippet
      luasnip.snippet("if", {
        luasnip.text_node("if "),
        luasnip.insert_node(1, "condition"),
        luasnip.text_node({" {", "\t"}),
        luasnip.insert_node(0),
        luasnip.text_node({"", "}"}),
      }),
      -- for snippet
      luasnip.snippet("for", {
        luasnip.text_node("for "),
        luasnip.insert_node(1, "i := 0; i < n; i++"),
        luasnip.text_node({" {", "\t"}),
        luasnip.insert_node(0),
        luasnip.text_node({"", "}"}),
      }),
      -- fmt.Println snippet
      luasnip.snippet("print", {
        luasnip.text_node('fmt.Println("'),
        luasnip.insert_node(1),
        luasnip.text_node('")'),
      }),
    })

    -- Ensure LSP capabilities are enhanced for nvim-cmp
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions (gopls)
        { name = "luasnip" },  -- snippets
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- Trigger completion automatically for Go
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        cmp.setup.buffer({
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        })
      end,
    })
  end,
}
