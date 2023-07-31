" Please see following documentations for how to set up options and use key
" mappings
" https://neovim.io/doc/user/options.html
" https://neovim.io/doc/user/map.html

" Set theme
colorscheme slate

" Add code highlights
syntax on

" Show line numbers and highlight current line
set number
set cursorline

" Indent configurations
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set smartindent

" Other global settings
set nowrap
set incsearch

" Show trailing whitespaces
highlight ExtraWhitespace ctermbg=darkred ctermfg=white
match ExtraWhitespace /\s\+$/

" Map Ctrl+L to clear highlights; this is useful after searching
nnoremap <nowait><silent> <Leader><C-L> :nohlsearch<CR>
