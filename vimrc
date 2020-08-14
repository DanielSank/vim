call plug#begin('~/.vim/plugged')

Plug 'jlanzarotta/bufexplorer'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'leafgarland/typescript-vim'
Plug 'vim-test/vim-test'
Plug 'Valloric/YouCompleteMe'


call plug#end()

"" bufexplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0
" Let \\ open the bufexplorer
nmap <Leader>\ <Leader>be

"" ctrl-P
let g:ctrlp_working_path_mode = 'ra'
" match window goes at the bottom with results in top-to-bottom order
let g:ctrlp_match_window = 'bottom,order:ttb'

"" easymotion
let g:EasyMotion_do_mapping = 0  " Disable default mappings
let g:EasyMotion_smartcase = 1  " Case insensitive feature
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-b)
map <Leader>l <Plug>(easymotion-w)

"" tagbar
nmap <F8> :TagbarToggle<CR>

"" silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Fast and respects gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " No cache
  let g:ctrlp_user_caching = 0
endif
" create the Ag editor command to allow custom ag searches
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" now map \/ to recursive search
nnoremap <Leader>/ :Ag<space>''<left>

"" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" YouCompleteMe
nnoremap <Leader>gd :YcmCompleter GoToDefinition<Cr>
nnoremap <Leader>gr :YcmCompleter GoToReferences<Cr>

"" **General editor stuff**

" Ignore certain filetypes
set wildignore=*.git,*.bak,*.pyc,*.swp,*.swp,*~

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
