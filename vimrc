call plug#begin('~/.vim/plugged')

Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'leafgarland/typescript-vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" bufexplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0
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
