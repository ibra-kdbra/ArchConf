-- ~/.config/nvim/lua/colors.lua

return {{
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Load before other color schemes
    config = function()
        -- Configure catppuccin
        require('catppuccin').setup({
            flavour = 'mocha', -- Choose mocha variant
            transparent_background = true -- Enable transparency
        })
        require('catppuccin').load() -- Apply color scheme
    end
} -- { 'Mofiqul/dracula.nvim' },
}

