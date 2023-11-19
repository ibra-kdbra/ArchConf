" Simple 'zero plugins' vim config

filetype plugin on
syntax on

let g:netrw_altv=1
let g:netrw_browser_split=4
let g:netrw_liststyle=3

let mapleader=" "

set autoindent
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set listchars=tab:\|\ 
set mouse=a
set nolist
set noswapfile
set number
set path-=/usr/include
set path+=$PWD/**
set relativenumber
set ruler
set shiftwidth=2
set showcmd
set showmode
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set timeoutlen=750
set wildmenu
set wildoptions=pum
set wildignore=.git/*

" Use rg for grep command 
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -.\ -g\ !'.git/**'
set grepformat=%f:%l:%c:%m

" keyboard shortcuts
" normal
nmap <leader>f :fin<space>
nmap <leader>b :buffer<space>
nmap <Leader>g :lgrep<Space>
nmap <leader>ws :w !sudo tee % > /dev/null
nmap <silent> <leader>, :lprevious<CR>
nmap <silent> <leader>. :lnext<CR>
nmap <silent> <leader>c :let @/=""<cr>
nmap <silent> <leader>o :noh<cr>
nmap <silent> <leader>h :bprevious<cr>
nmap <silent> <leader>l :bnext<cr>
nmap <silent> <leader>n :Exp<cr>
nmap <silent> <leader>r :set norelativenumber!<cr>
nmap <silent> <leader>t :term<cr>
nmap <silent> <leader>z :Format<cr>
nmap <leader>zz :!shfmt -i 2 -w %<cr>
nmap <silent> <leader>w :bd<cr>
nmap <silent> <leader>wq :bd!<cr>
nmap <silent> <leader><Tab> :set invlist<cr>
" insert
imap jk <ESC>
" visual
vmap < <gv
vmap > >gv

colorscheme habamax

" cursor
" steady bar in insert mode
let &t_SI = "\e[6 q"
" else steady block
let &t_EI = "\e[2 q"

" Reset cursor on startup. Required for some terminals like wezterm
augroup ResetCursorShape
	autocmd!
	autocmd VimEnter * :normal :startinsert :stopinsert
augroup END

" automatically leave insert mode after 'updatetime' milliseconds of inaction
augroup BackToNormal
  autocmd!
  autocmd CursorHoldI * stopinsert
  " set 'updatetime' to 30 seconds when in insert mode
  autocmd InsertEnter * let updaterestore=&updatetime | set updatetime=30000
  autocmd InsertLeave * let &updatetime=updaterestore
augroup END
