-- ~/.config/nvim/lua/plugins.lua

return {
    {
      -- Catppuccin colorscheme for (Neo)vim : https://github.com/catppuccin/nvim
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 1000, -- Load earlier for color schemes
  
      config = function()
        -- Catppuccin configuration
        require('catppuccin').setup({
          flavour = 'mocha', -- Choose the mocha variant
          transparent_background = true, -- Enable transparency
        })
        require('catppuccin').load() -- Apply the color scheme
      end,
    },
  
    -- Dracula colorscheme : https://github.com/Mofiqul/dracula.nvim
    -- { 'Mofiqul/dracula.nvim' },
  
    -- Which Key : https://github.com/folke/which-key.nvim
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- Main settings
        preset = "helix", -- Choose the style: "classic", "modern", "helix"
        delay = 350, -- Delay before showing the window (in milliseconds)
        -- Window settings
        win = {
          border = "rounded", -- Border style: "none", "single", "double", "rounded"
          padding = { 1, 2 }, -- Padding inside the window [top/bottom, left/right]
        },
      },
      config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      
      -- Registering prefixes
      wk.add({
        { "<leader>c", group = " NerdCommenter" },
        { "<leader>f", group = " Fzf" },

        { "<leader>b", desc = "Buffer Next" },
        { "<leader>B", desc = "Buffer Prev" },

        { "<leader>o", desc = "Explorer Files" },
        { "<leader>O", desc = "Explorer Files Vsplit" },

        { "<leader>Q", desc = "Delete Buffer" },
        { "<leader>S", desc = "Save Buffer" },

        { "<leader>t", desc = "Terminal Split" },
        { "<leader>T", desc = "Terminal Vsplit" },

        { "<leader>v", desc = "Window Vsplit" },
        { "<leader>V", desc = "Window Buffer Vsplit" },

        { "<leader>/", desc = "NoHlSearch" },
        { "<leader><space>", desc = "EasyMotion" },
      })
    end,
    },
  
  }  
