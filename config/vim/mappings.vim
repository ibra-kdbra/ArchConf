" --------------------------------------------------------
" Key bindings
" --------------------------------------------------------

" change mapleader to " ", default - "\"
let mapleader=" "
" set timeout after pressing
set timeoutlen=5000 ttimeoutlen=0

" help on word when pressing K
let &keywordprg=':help'

" <Leader><space> - disable search highlighting
nmap <Leader>/ :nohlsearch <CR>

" <Leader>S - save file
nmap <Leader>S :w! <CR>

" <Leader>Q - close buffer without saving
nmap <Leader>Q :bp\|bd! #<CR>

" <Leader>b - toggle buffer
nmap <Leader>b :b# <CR>
" <Leader>b - next buffer
nmap <Leader>b :bn <CR>
" <Leader>B - previous buffer
" nmap <Leader>B :bp <CR>

" copy to system clipboard: select, then "+y
vmap <C-c> "+y
" paste from system clipboard: Ctrl-Shift-v
" paste from vim buffer in insert mode: Ctrl-r + "
" list of all buffers/registers: :registers

" vsplit|split
" nmap <Leader>v :vsplit
" nmap <Leader>vs :split
" vsplit|split by buffer number
"nmap <Leader>V :vertical sb
" nmap <Leader>VS :sb

" Vsplit and Tab
nmap <Leader>v :vertical sb%
nmap <Leader>V :tab sb%

" switch split
nmap <C-Left> <C-W>h
nmap <C-Down> <C-W>j
nmap <C-Up> <C-W>k
nmap <C-Right> <C-W>l

" change split size
nmap <C-S-Left> <C-W><
nmap <C-S-Down> <C-W>-
nmap <C-S-Up> <C-W>+
nmap <C-S-Right> <C-W>>

" move with arrows in command mode
cnoremap <Down> <C-n>
cnoremap <Up> <C-p>

" F4 - paste mode (Paste)
nmap <F4> :set paste! <CR>
imap <F4> <Esc> :set paste! <CR>

" F5 - save file
nmap <F5> :w! <CR>
imap <F5> <Esc> :w! <CR>
" Shift-F5 - save with sudo
nmap <S-F5> :execute ':silent w !sudo tee % > /dev/null' <bar> :edit! <CR>

" F6 - save folds
" nmap <F6> :mkview <CR>
" Shift-F6 - load folds
" nmap <S-F6> :loadview <CR>

" F7 - show spaces and tabs
nmap <F7> :set list! <CR>
" Shift-F7 - use tabs instead of spaces
nmap <S-F7> :set noet! <CR>

" F8 - disable line numbering
nmap <F8> :set number! relativenumber! <CR>
" Shift-F8 - relative line numbering
nmap <S-F8> :set relativenumber! <CR>

" F9 - disable mouse
nmap <F9> :set mouse= <CR>
" Shift-F9 - enable mouse
nmap <S-F9> :set mouse=a <CR>

" F11 - spell checking
" map <F11> :setlocal spelllang=ru spell! <CR>
" ]s - next misspelled word
" [s - previous misspelled word
" z= - replace with list
" zg - add to dictionary
" zw - remove from dictionary
" zG - ignore word

" F11 - csv highlighting
nmap <F11> :set filetype=text <CR>
nmap <S-F11> :set filetype=csv <CR>

" F12 - diff mode
nmap <F12> :set diff! <CR>

" --------------------------------------------------------
" Help Some Keys
" --------------------------------------------------------

" --------------------------------------------------------
" eVim - enter normal mode: ctrl-l
" --------------------------------------------------------
" ctrl-g - show which file is edited
" --------------------------------------------------------
" autocompletion by i_ctrl-x_ then:
" ctrl-l - add line
" ctrl-n ctrl-p ctrl-i - add word
" ctrl-f - add filename
" ctrl-o - add from language (autocompletion)
" --------------------------------------------------------
" i_ctrl-o - enter normal mode for one command
" --------------------------------------------------------
" ~, U, u - change case
" :%s/\<./\u&/g - First Letter Upper
" --------------------------------------------------------
" sort - select - :sort
" reverse sort - select - :sort!
" unique sort - select - :sort u
" --------------------------------------------------------
" = (on selected) - correct indent
" --------------------------------------------------------
" gf - open path under cursor
" gx - open link in browser
" gv - repeat selection
" --------------------------------------------------------
" gt - next tab
" ctrl-w + T - move split to another tab
" --------------------------------------------------------
" ctrl-w + q - close window (buffer is open)
" ctrl-w + o - close other splits
" ctrl-w + s - open split
" ctrl-w + v - open vsplit
" ctrl-w + r - swap windows (splits)
" ctrl-w + H(L) - swap split to vertical
" ctrl-w + K(J) - swap vertical to split
" :[vertical] sb<num_buffer> - vsplit|split by buffer number
" --------------------------------------------------------
" ctrl-e and ctrl-y - screen down/up with saving cursor
" ctrl-d and ctrl-u - screen down/up by half
" --------------------------------------------------------
" m<letter> - create mark
" '<letter> - go to start of line mark
" `<letter> - go to mark
" --------------------------------------------------------
" '' or `` - go to previous position
" ma - create mark
" `a - go to mark a
"  '] `] - move to end after copying
" :jumps - jump history
" ctrl-o and ctrl-i - move by jump history
" :changes - change history
" g; and g, - move by change history
" --------------------------------------------------------
" ctrl-] and ctrl-t - move by help topics
" --------------------------------------------------------
" q<letter> - create macro, finish q
" @<letter> - call macro
" --------------------------------------------------------
" folding on leading spaces
" set foldmethod=indent
" folding on syntax
" set foldmethod=syntax
"
" v/V and zf - select block and create fold
" zd - delete fold
"
" zc – fold block
" zo – unfold block
" zm - fold all folds
" zr - unfold all folds
" za – invert
" zi - invert all folds
"
" zk - go to fold above by text
" zj - go to fold below by text
"
" :mkview - save fold structure
" :loadview - load fold structure
" --------------------------------------------------------
" :mksession[!] [filename] - save session
" :source [filename] - load session
" --------------------------------------------------------

