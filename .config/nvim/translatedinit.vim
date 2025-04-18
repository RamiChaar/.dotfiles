" Tabs and indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" Clipboard
set clipboard+=unnamedplus
" Text wrapping
set nowrap
" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase
" Scrolling and display
set scrolloff=8
set isfname+=@-@

" Leader key
let mapleader=" "
" Key mappings
nnoremap - :Ex<CR>
" Create a new file in the directory of the current file
nnoremap <leader>n :call CreateFile()<CR>
function! CreateFile()
  let file_name = input("File Name > ")
  execute ":e %:h/" . file_name
  execute ":w"
endfunction
" Move highlighted text
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv
" Select all
nnoremap <leader>= ggVG
" Keep cursor in the middle when jumping and searching
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
" Retain paste buffer
xnoremap <leader>p "_dP
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" Exit vertical edit mode
inoremap <C-c> <Esc>
" Disable Q and J commands
nnoremap Q <nop>
nnoremap J <nop>
