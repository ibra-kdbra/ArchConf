-- ~/.config/nvim/init.lua
-- Basic settings (VimScript)
vim.cmd('source ~/.config/vim/settings.vim')

-- Key bindings
vim.cmd('source ~/.config/vim/mappings.vim')

-- Terminal and Explorer
vim.cmd('source ~/.config/vim/explorers.vim')

-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable',
                   lazypath})
end
vim.opt.rtp:prepend(lazypath)

-- Dynamically register Vim-Plug plugins from the plugged/ directory
local plugged_dir = vim.fn.stdpath('data') .. '/plugged'
local plugged_plugins = {}
if vim.fn.isdirectory(plugged_dir) == 1 then
    for _, dir in ipairs(vim.fn.readdir(plugged_dir)) do
        local plugin_path = plugged_dir .. '/' .. dir
        if vim.fn.isdirectory(plugin_path) == 1 then
            table.insert(plugged_plugins, {
                dir = plugin_path,
                name = dir,
                lazy = false -- Загружаем сразу
            })
        end
    end
end

-- Lazy.nvim setup
require('lazy').setup({ 
    -- Neovim Plugins: ~/.config/nvim/lua/plugins.lua
{
    import = 'plugins'
}, -- Neovim LSP: ~/.config/nvim/lua/lsp.lua
{
    import = 'lsp'
}, 
  -- implemented through LSP
  -- Emmet: ~/.config/nvim/lua/emmet.lua
  -- { import = 'emmet' },
-- Vim plugins from plugged/
plugged_plugins, 

-- vim-plug for installing Vim plugins
-- :PlugInstall
{
    'junegunn/vim-plug',
    config = function()
        local plug_script = vim.fn.stdpath('data') .. '/lazy/vim-plug/plug.vim'
        if vim.fn.filereadable(plug_script) == 1 then
            vim.cmd('source ' .. plug_script)
            vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
            vim.cmd('source ~/.config/vim/plugins.vim')
            -- vim.cmd('source ~/.config/vim/ide.vim')
            vim.fn['plug#end']()
        else
            print('vim-plug script not found at ' .. plug_script .. '. Run :Lazy sync to install.')
        end
    end
}})
