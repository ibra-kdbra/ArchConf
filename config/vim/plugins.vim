" ----------------------------------------
" Main plugins
" ----------------------------------------

" ----------------------------------------
" Lightline-Bufferline - display buffers in Lightline
" Lightline - status line
" Vim-Devicons - icons Nerd
" CSS Color - colors css

" FZF - fuzzy search
" EasyMotion - easy movements

" Auto Pairs - paired brackets and quotes
" Repeat - extended repeat by "."
" Match-up - move by tags, brackets...
" NERD Commenter - commenting for different languages

" Polyglot - collection of language packages for Vim
" Xkbswitch - switch to En when switching to command mode
" ----------------------------------------
" only for 
" ----------------------------------------
" PaperColor - color scheme
" Supertab - completion by <Tab>
" ----------------------------------------
" disabled
" ----------------------------------------
" Startify - start screen
" NERD Tree - file manager
" MRU - latest opened files
" Buffer Explorer - switch open buffers
" Tagbar - window-tag list
" ----------------------------------------
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

" Vim-Devicons - icons Nerd
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

" FZF - fuzzy search
" ---------------
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" ---------------
" see commands in ~/.config/vim/explorers.vim
" ---------------
" ----------------------------------------

" EasyMotion - easy movements
" ---------------
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
" ---------------
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Enable smart case
let g:EasyMotion_smartcase = 1
" Custom mapping: <Leader><Leader> calls bidirectional search
nnoremap <Space><Space> <Plug>(easymotion-s)
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

" Repeat - extended repeat by "."
" ---------------
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" ---------------
" ----------------------------------------

" Match-up - move by tags, brackets...
" key %
" " ---------------
" https://github.com/andymass/vim-matchup
Plug 'andymass/vim-matchup'
" ---------------
" ----------------------------------------
" NERD Commenter - commenting for various languages
" ---------------
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" ---------------
" disable double commenting
" let g:NERDDefaultNesting = 0
" add spaces after comment symbols
let g:NERDSpaceDelims = 1
" change comment symbols
" \ 'lang': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#'}
    \}

" Disable default keybindings for NERDCommenter
let g:NERDCreateDefaultMappings = 0

" Common keybindings for normal and visual modes
noremap <leader>cc <Plug>NERDCommenterComment
noremap <leader>cu <Plug>NERDCommenterUncomment
noremap <leader>c<space> <Plug>NERDCommenterToggle


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
" path to library
	let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
" ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" only for Vim
if ! has('nvim')
	" PaperColor - color scheme
	" ---------------
	" https://github.com/NLKNguyen/papercolor-theme
	Plug 'nlknguyen/papercolor-theme'
	" ---------------
	" ----------------------------------------

	" Supertab - completion with <Tab>
	" ---------------
	" https://github.com/ervandew/supertab
	Plug 'ervandew/supertab'
	" ---------------
	let g:SuperTabDefaultCompletionType = "<c-n>"
	let g:SuperTabContextDefaultCompletionType = "<c-n>"
	" ----------------------------------------
endif

" ----------------------------------------
" ----------------------------------------

" " Startify - start screen
" " ---------------
" " https://github.com/mhinz/vim-startify
" Plug 'mhinz/vim-startify'
" " ---------------
" " ----------------------------------------

" " NERD Tree - file manager
" " ---------------
" " https://github.com/scrooloose/nerdtree
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" " ---------------
" " automatically update buffer after renaming file
" let NERDTreeAutoDeleteBuffer = 1
" " show hidden files
" let NERDTreeShowHidden = 1
" " line numbers
" let NERDTreeShowLineNumbers = 1
" " open on the right side
" let g:NERDTreeWinPos = "left"
" " close after opening file
" let NERDTreeQuitOnOpen = 1
" " NERDTreeToggle - <Leader>op
" map <Leader>op :NERDTreeToggle <CR>
" " ----------------------------------------

" " MRU - recently opened files
" " ---------------
" " https://github.com/vim-scripts/mru.vim
" Plug 'vim-scripts/mru.vim'
" " ---------------
" " <Leader>ol - show list of recent files
" map <Leader>ol :MRU <CR>
" " ----------------------------------------

" " Buffer Explorer - switch between open buffers
" " ---------------
" " https://github.com/vim-scripts/bufexplorer.zip
" Plug 'vim-scripts/bufexplorer.zip'
" " ---------------
" " <Leader>be - open Buffer Explorer
" " <Leader>bs - open Buffer Explorer (horizontal)
" " <Leader>bv - open Buffer Explorer (vertical)
" " ----------------------------------------

" " Tagbar - tag list window
" " (requires installed ctags)
" " list of supported languages
" " ctags --list-languages
" " list of tags for specific language
" " ctags --list-kinds=<Lang>
" " ---------------
" " https://github.com/majutsushi/tagbar
" Plug 'majutsushi/tagbar'
" " ---------------
" nmap <Leader>tb :TagbarToggle<CR>
" let g:tagbar_sort = 0
" let g:tagbar_show_linenumbers = 2
" " ----------------------------------------

" ----------------------------------------
" ----------------------------------------

" vim:ft=vim

