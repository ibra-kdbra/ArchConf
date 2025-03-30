" ----------------------------------------
" Color Scheme
" ----------------------------------------

" setting color scheme
if has('nvim')
    colorscheme catppuccin-mocha
else
    colorscheme PaperColor
endif

" transparency
highlight Normal guibg=NONE ctermbg=NONE

" ----------------------------------------

" Spelling - font color when checking

" red color - spelling mistakes
" highlight clear SpellBad
" highlight SpellBad ctermfg=Red

" blue color - missing capitalization
" highlight clear SpellCap
" highlight SpellCap ctermfg=Blue

" ----------------------------------------
" ----------------------------------------

" vim:ft=vim

