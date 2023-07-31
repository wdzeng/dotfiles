set wrap
set textwidth=72
set complete+=kspell

" Highlight texts that exceed the maximal line width
highlight OverLength ctermbg=darkred ctermfg=white
match OverLength /\%73v.*/
