call plug#begin(stdpath('data') . '/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'windwp/nvim-autopairs'
call plug#end()


"" bufexplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0
" Let \\ open the bufexplorer
nmap <Leader>\ <Leader>be

"" easymotion
let g:EasyMotion_do_mapping = 0  " Disable default mappings
let g:EasyMotion_smartcase = 1  " Case insensitive feature
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-b)
map <Leader>l <Plug>(easymotion-w)

"" fzf
map <Leader>a :GFiles<CR>
map <Leader>A :GFiles?<CR>
map <Leader>s :Rg <C-r><C-w><CR>
" trailing whitespace intentional here
map <Leader>S :Rg 
map <Leader>d :BLines<CR>
map <Leader>D :Lines<CR>
map <Leader>v :Buffers<CR>

"" tagbar
nmap <F8> :TagbarToggle<CR>

"" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" **General editor stuff**

" Ignore certain filetypes
set wildignore=*.git,*.bak,*.pyc,*.swp,*.swp,*~
:set guicursor=i:block

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

lua << EOF
require "lsp_signature".setup()
require'lspconfig'.pyright.setup{}
require('lspfuzzy').setup{}
EOF

so ~/.config/nvim/lsp.vim
