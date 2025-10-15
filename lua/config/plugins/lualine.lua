return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VeryLazy", -- Load after startup for better performance
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    
    lualine.setup({
      options = {
        colorscheme = "auto",
      },
      sections = {
        lualine_a = {
          {
            'mode',
            -- Use the following to shorten mode names to single/two chars to save space
            --fmt = function(str)
            --  -- Shorten mode names
            --  local mode_map = {
            --    ['NORMAL'] = 'N',
            --    ['INSERT'] = 'I', 
            --    ['VISUAL'] = 'V',
            --    ['V-LINE'] = 'VL',
            --    ['V-BLOCK'] = 'VB',
            --    ['COMMAND'] = 'C',
            --    ['REPLACE'] = 'R',
            --  }
            --  return mode_map[str] or str:sub(1,1)
            --end
          }
        },
        lualine_b = {
          {
            'branch',
            cond = function()
              return vim.fn.winwidth(0) > 80 -- Only show git branch if window is wider than 80 chars
            end
          }
        },
        lualine_c = {
          {
            'filename',
            path = 1, -- Show relative path
            shorting_target = 40, -- Shorten long paths
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed  = '[No Name]',
              newfile  = '[New]',
            }
          }
        },
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
      inactive_sections = {
        lualine_a = {
          {
            'mode',
            -- Use the following to shorten mode names to single/two chars to save space
            --fmt = function(str)
            --  -- Shorten mode names
            --  local mode_map = {
            --    ['NORMAL'] = 'N',
            --    ['INSERT'] = 'I', 
            --    ['VISUAL'] = 'V',
            --    ['V-LINE'] = 'VL',
            --    ['V-BLOCK'] = 'VB',
            --    ['COMMAND'] = 'C',
            --    ['REPLACE'] = 'R',
            --  }
            --  return mode_map[str] or str:sub(1,1)
            --end
          }
        },
        lualine_b = {
          {
            'branch',
            cond = function()
              return vim.fn.winwidth(0) > 80 -- Only show git branch if window is wider than 80 chars
            end
          }
        },
        lualine_c = {
          {
            'filename',
            path = 0, -- Show relative path
            shorting_target = 40, -- Shorten long paths
            symbols = {
              modified = '[+]',
              readonly = '[-]',
              unnamed  = '[No Name]',
              newfile  = '[New]',
            }
          }
        },
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
