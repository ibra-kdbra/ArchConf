" ----------------------------------------
" Basic plugins
" ----------------------------------------

" PaperColor - color scheme
" Lightline-Bufferline - display buffers in Lightline
" Lightline - status line
" Vim-Devicons - Nerd icons
" CSS Color - css colors

" Startify - start screen
" NERD Tree - file manager
" MRU - recently opened files
" Buffer Explorer - switch between open buffers
" FZF - fuzzy search

" Auto Pairs - pair brackets and quotes
" NERD Commenter - comment for different languages

" EasyMotion - simple movements
" Tagbar - window with list of tags
" Repeat - repeat by "."
" Supertab - complete by <Tab>
" Match-up - move by tags, brackets...

" Polyglot - collection of language packages for Vim
" Xkbswitch - switch to En when entering command mode

" ----------------------------------------
" ----------------------------------------

" PaperColor - color scheme
" ---------------
" https://github.com/NLKNguyen/papercolor-theme
Plug 'nlknguyen/papercolor-theme'
" ---------------
" ----------------------------------------

" Lightline-Bufferline - display buffers in Lightline
" ---------------
" https://github.com/mengelbrecht/lightline-bufferline
Plug 'mengelbrecht/lightline-bufferline'
" ---------------
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
" ----------------------------------------

" Lightline - status line
" ---------------
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'
" ---------------
let g:lightline = {
	  \ 'tabline': {
	  \   'left': [ ['buffers'] ],
	  \   'right': [ ['close'], ['tabs'] ]
	  \ },
	  \ 'component_expand': {
	  \   'buffers': 'lightline#bufferline#buffers'
	  \ },
	  \ 'component_type': {
	  \   'buffers': 'tabsel'
	  \ },
	  \ }

" clickable only for nvim (now not work - bug)
" let g:lightline.component_raw = {'buffers': 1}
" let g:lightline#bufferline#clickable = 1
" ----------------------------------------

" Vim-Devicons - Nerd icons
" ---------------
" https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'
" ---------------
" ----------------------------------------

" CSS Color - colors css
" ---------------
" https://github.com/ap/vim-css-color
Plug 'ap/vim-css-color'
" ---------------
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" Startify - start screen
" ---------------
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'
" ---------------
" ----------------------------------------

" NERD Tree - file manager
" ---------------
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" ---------------
" automatically update buffer after renaming file
let NERDTreeAutoDeleteBuffer = 1
" show hidden files
let NERDTreeShowHidden = 1
" line numbers
let NERDTreeShowLineNumbers = 1
" open on right side
let g:NERDTreeWinPos = "left"
" close after opening file
let NERDTreeQuitOnOpen = 1
" NERDTreeToggle - <Leader>op
map <Leader>op :NERDTreeToggle <CR>
" ----------------------------------------

" MRU - recently opened files
" ---------------
" https://github.com/vim-scripts/mru.vim
Plug 'vim-scripts/mru.vim'
" ---------------
" <Leader>ol - show list of recently opened files
map <Leader>ol :MRU <CR>
" ----------------------------------------

" Buffer Explorer - switch between open buffers
" ---------------
" https://github.com/vim-scripts/bufexplorer.zip
Plug 'vim-scripts/bufexplorer.zip'
" ---------------
" <Leader>be - open Buffer Explorer
" <Leader>bs - open Buffer Explorer (horizontally)
" <Leader>bv - open Buffer Explorer (vertically)
" ----------------------------------------

" FZF - fuzzy search
" ---------------
" https://github.com/junegunn/fzf.vim
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" ---------------
" see commands in ~/.config/vim/explorers.vim
" ---------------
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------
" Auto Pairs - paired brackets and quotes
" ---------------
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" ---------------
let g:AutoPairsShortcutFastWrap = ''  " Fast Wrap
let g:AutoPairsShortcutJump = ''  " Jump to next closed pair
let g:AutoPairsShortcutBackInsert = ''  " BackInsert
" Toggle Autopairs
" let g:AutoPairsShortcutToggle = '<Leader>pp'
" ----------------------------------------

" NERD Commenter - commenting for various languages
" ---------------
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" ---------------
" disable double comments
" let g:NERDDefaultNesting = 0
" add spaces after comment
let g:NERDSpaceDelims = 1
" change comment sign
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#'}
    \}
" comment
" [count]|<leader>|cc |NERDComComment|
" uncomment
" [count]|<Leader>|cu |NERDComUncommentLine|
" toggle comment/uncomment
" [count]|<Leader>|c<space> |NERDComToggleComment|
" block formatted comment
" [count]<leader>cs |NERDComSexyComment|
" invert comment/uncomment
" [count]|<Leader>|ci |NERDComInvertComment|
" comment at the end of line
" |<Leader>|cA |NERDComAppendComment|
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" EasyMotion - easy motions
" ---------------
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
" ---------------
" disable case sensitivity
let g:EasyMotion_smartcase = 1
" default keys, where <Leader> is <Leader><Leader>
" Default Mapping      | Details
"    ---------------------|----------------------------------------------
"    <Leader>f{char}      | Find {char} to the right. See |f|.
"    <Leader>F{char}      | Find {char} to the left. See |F|.
"    <Leader>t{char}      | Till before the {char} to the right. See |t|.
"    <Leader>T{char}      | Till after the {char} to the left. See |T|.
"    <Leader>w            | Beginning of word forward. See |w|.
"    <Leader>W            | Beginning of WORD forward. See |W|.
"    <Leader>b            | Beginning of word backward. See |b|.
"    <Leader>B            | Beginning of WORD backward. See |B|.
"    <Leader>e            | End of word forward. See |e|.
"    <Leader>E            | End of WORD forward. See |E|.
"    <Leader>ge           | End of word backward. See |ge|.
"    <Leader>gE           | End of WORD backward. See |gE|.
"    <Leader>j            | Line downward. See |j|.
"    <Leader>k            | Line upward. See |k|.
"    <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
"    <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
"    <Leader>s            | Find(Search) {char} forward and backward.
" ----------------------------------------

" Tagbar - tag list window
" (requires installed ctags)
" list of supported languages
" ctags --list-languages
" list of tags for a specific language
" ctags --list-kinds=<Lang>
" ---------------
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
" ---------------
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 2
" ----------------------------------------

" Repeat - extended repeat with "."
" ---------------
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" ---------------
" ----------------------------------------

if ! has('nvim')
	" Supertab - addition to <Tab>
	" ---------------
	" https://github.com/ervandew/supertab
	Plug 'ervandew/supertab'
	" ---------------
	let g:SuperTabDefaultCompletionType = "<c-n>"
	let g:SuperTabContextDefaultCompletionType = "<c-n>"
	" ----------------------------------------
endif

" Match-up - navigation by tags, brackets...
" key %
" " ---------------
" https://github.com/andymass/vim-matchup
Plug 'andymass/vim-matchup'
" ---------------
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" Polyglot - collection of language packs for Vim
" ---------------
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
" ---------------
" ----------------------------------------

" Xkbswitch - switch to En when entering command mode
" ---------------
" library
" https://github.com/ierton/xkb-switch - for *nix
" https://github.com/DeXP/xkb-switch-win - for Win
" https://github.com/myshov/xkbswitch-macosx - for Mac
" plugin
" https://github.com/lyokha/vim-xkbswitch
Plug 'lyokha/vim-xkbswitch'
" ---------------
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchIMappingsTr = {
          \ 'ru':
          \ {'<': 'qwertyuiopasdfghjkl;zxcvbnm.`/'.
          \       'QWERTYUIOPASDFGHJKL:ZXCVBNM<>?~@#$^&|',
          \  '>': 'йцукенгшщзфывапролджячсмитьюё.'.
          \       'ЙЦУКЕНГШЩЗФЫВАПРОЛДЖЯЧСМИТЬБЮ,Ё"№;:?/'},
          \ }
" path to the library
	let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" vim:ft=vim

