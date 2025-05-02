" ----------------------------------------
" Color Scheme
" ----------------------------------------

" setting color scheme
if has('nvim')
    colorscheme PaperColor
else
    colorscheme catppuccin-mocha
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

