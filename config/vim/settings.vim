" ----------------------------------------
" Basic settings
" ----------------------------------------

" disable compatibility with vi
set nocompatible

" 256 colors
set t_Co=256

" mouse in all modes
set mouse=a

" auto-update file when changed
set autoread

" disable backups
set nobackup

" disable swap files
set noswapfile

" do not unload buffer when switching files
set hidden

" file type detection
filetype plugin indent on

" syntax highlighting
syntax on

" color scheme - (via plugin)
set background=dark

" line numbering
set number

" show relative line numbers
set relativenumber

" show buffer name in terminal title
set title

" show cursor position line
set ruler

" enable command display
set showcmd

" enable highlighting of invisible characters
set list

" tabs and spaces
set listchars=trail:.,tab:--

" 4 spaces per tab
set expandtab
set tabstop=4

" shift width for "<" and ">" keys
set shiftwidth=4

" enable smart indenting
set smartindent

" inherit indentation from previous line
set autoindent

" always show the status line
set laststatus=2

" always show the tab line
set showtabline=2

" enable line wrapping
set wrap

" word wrap instead of letter wrap
set linebreak

" command-line autocompletion
set wildmenu
set wcm=<TAB>

" search highlighting
set hlsearch

" incremental search
set incsearch

" ignore case in search
set ignorecase

" default encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251
" set termencoding=utf-8

" :vsplit opens windows to the right
set splitright

" :split opens windows below
set splitbelow

" .vimrc from startup directory
" set exrc
" set secure

" color column line
" set colorcolumn=120

" highlight current line|column
set cursorline
" set cursorcolumn

" status line description
" set statusline=%<%r%m\ %f:%y\ %=\ %-15(%l,%c:%v\ %p%%%)
" set statusline+=\ %{strftime(\"%H:%M\ %d.%m.%Y\ %a\")}

" show matching bracket after entering the second one
" set showmatch

" show the full list of available options
" set wildmode=list:longest,full

" stop search at end of file
" set nowrapscan

" file encodings for auto-detection
" set fileencodings=utf-8,koi8-r,cp1251,cp866

" folding based on line indentation
" set foldmethod=indent
" folding based on syntax
" set foldmethod=syntax

" for proper Vim operation in Alacritty(ctrl+left|right)
" if ! has('nvim')
	" set term=xterm-256color
" endif

" ----------------------------------------
" ----------------------------------------

" vim:ft=vim

