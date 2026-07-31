-- noice.nvim: replaces the message/cmdline/popupmenu UI with clean floating
-- windows, and makes LSP hover/signature/errors look sharp.
-- nvim-notify provides the fading notification toasts (used for errors etc.).
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          timeout = 3000,
          stages = "fade",
          render = "compact",
          max_width = 80,
        },
      },
    },
    opts = {
      lsp = {
        -- Use Treesitter to highlight markdown in LSP docs, and let noice
        -- override the default hover/signature popups.
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- classic bottom cmdline for `/` search
        command_palette = true,       -- position cmdline + popupmenu together
        long_message_to_split = true, -- send long messages to a split
        inc_rename = false,
        lsp_doc_border = true,        -- add a border to hover/signature docs
      },
      routes = {
        -- Send "written"/"lines yanked" style noise to the mini view, not popups.
        {
          filter = { event = "msg_show", kind = "", find = "written" },
          opts = { skip = true },
        },
      },
    },
    keys = {
      { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice: last message" },
      { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice: message history" },
      { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Noice: dismiss all" },
    },
  },
}
