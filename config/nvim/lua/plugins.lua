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
        delay = 550, -- Delay before showing the window (in milliseconds)
        -- Window settings
        win = {
          border = "rounded", -- Border style: "none", "single", "double", "rounded"
          padding = { 1, 2 }, -- Padding inside the window [top/bottom, left/right]
        },
      },
    },
  
  }  
