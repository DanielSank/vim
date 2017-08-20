call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Let \\ open the bufexplorer
map <Leader>\ <Leader>be

" Use silversearcher instead of grep
set grepprg=ag\ --nogroup\ --nocolor

" Use Silversearcher for CTL P
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Use jj instead of ESC
inoremap jj <Esc>

filetype on
filetype plugin on
filetype indent on
syntax on

" Show tab and whitespace
set list
set listchars=tab:>-,space:·

" Show matching braces etc.
set showmatch
" highlight search results
set hlsearch
" Map ENTER to turn off search highlighting
nnoremap <CR> :nohlsearch<CR>/<BS><CR>
