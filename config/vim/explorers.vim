" ----------------------------------------
" Terminal and Explorer
" ----------------------------------------

"  Terminal
" ---------------
if ! has('nvim')
	nmap <Leader>t :terminal <CR>
	nmap <Leader>T :vertical terminal <CR>
else
	nmap <Leader>t :split term://fish <CR> :startinsert <CR>
	nmap <Leader>T :vsplit term://fish <CR> :startinsert <CR>
endif

" ctrl-\ + ctrl-n - exit terminal -> on Esc
tnoremap <Esc> <C-\><C-n>

" ----------------------------------------
" ----------------------------------------

" Explore
" ---------------
" built-in explorer :Exp :Rex | :Tex | :Hex :Vex |:Lex :Sex

" gn - make directory root
" ctrl-l - update directory
" enter - open in this window
" t - open as tabs
" v - open as vsplit
" o - open as split
" ------------------

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:netrw_browse_split = 0        " Open files in the current window
let g:netrw_liststyle = 3           " Tree view style
" let g:netrw_preview   = 1
" let g:netrw_alto = 0
" let g:netrw_winsize   = 30

function ToggleExplorer()
    if &ft == "netrw"
        if exists("w:netrw_rexlocal")
            Rexplore
        else
            if exists("w:netrw_rexfile")
                exec 'e ' . w:netrw_rexfile
            endif
        endif
    else
        Explore
    endif
endfun

" noremap <Leader>oo :Exp <CR>
" noremap <Leader>O :Vex <CR>
noremap <Leader>O :call ToggleExplorer() <CR>

" ----------------------------------------
" ----------------------------------------

" NERD Tree
" ---------------
" <Leader>p - toggle open/close

" t - open tab
" v - open vsplit
" i - open split
" ---------------

" automatically update buffer after renaming file
let NERDTreeAutoDeleteBuffer = 1
" show hidden files
let NERDTreeShowHidden = 1
" line numbering
let NERDTreeShowLineNumbers = 1
" open on the right side
let g:NERDTreeWinPos = "left"
" window width
let g:NERDTreeWinSize = 35
" close after opening file
" let NERDTreeQuitOnOpen = 1
" NERDTreeToggle - <Leader>op
" remap keys for vsplit
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapPreviewVSplit = 'gv'

map <Leader>o :NERDTreeToggle <CR>

" ----------------------------------------
" ----------------------------------------

" FZF
" ---------------
" :help fzf-vim-commands
" ctrl-c - close window

" ctrl-t - open tab
" ctrl-x - open split
" ctrl-v - open vsplit
" ---------------

" FZF Buffers
nmap <Leader>fb :Buffers<CR>
" FZF Files
nmap <Leader>ff :Files<CR>
" FZF Windows
nmap <Leader>fw :Windows<CR>

" FZF Blines
nmap <Leader>f/ :BLines<CR>
" FZF Rg
nmap <Leader>fr :Rg<CR>
" FZF Btags
nmap <Leader>ft :BTags<CR>

" FZF Jumps
nmap <Leader>fj :Jumps<CR>
" FZF Changes
nmap <Leader>fc :Changes<CR>
" FZF Marks
nmap <Leader>fm :Marks<CR>
" FZF History
nmap <Leader>fh :History<CR>

" FZF GFiles? (git status)
nmap <Leader>fg :GFiles?<CR>

" f? - help
" FZF Helptags
nmap <Leader>f?h :Helptags<CR>
" FZF Normal mode mappings
nmap <Leader>f?m :Maps<CR>

" fs - settings
" FZF Color schemes
nmap <Leader>fsc :Colors<CR>
" FZF Filetypes
nmap <Leader>fsf :Filetypes<CR>

" ----------------------------------------
" ----------------------------------------

" vim:ft=vim
