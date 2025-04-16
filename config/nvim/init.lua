-- init.lua

-- Basic settings
vim.cmd('source ~/.config/vim/settings.vim')

-- Key bindings
vim.cmd('source ~/.config/vim/mappings.vim')

-- Terminal and Explorer
vim.cmd('source ~/.config/vim/explorers.vim')

-- Plugins (vim-plug)
-- https://github.com/junegunn/vim-plug
-- Reload .vimrc and :PlugInstall to install plugins
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'

-- Initialize vim-plug
vim.fn['plug#begin']()

-- General plugins
vim.cmd('source ~/.config/vim/pluggins.vim')

-- IDE plugins general
vim.cmd('source ~/.config/vim/ide_main.vim')

-- NeoVim IDE plugins
vim.cmd('source ~/.config/nvim/ide.vim')

-- Finish initializing vim-plug
vim.fn['plug#end']()

-- Color scheme
vim.cmd('source ~/.config/vim/colors.vim')

-- Neovim LSP Settings
require('lsp')