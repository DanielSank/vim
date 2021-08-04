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
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
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

" compe
" Allow tab to select an autocmoplete from compe
lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

so ~/.config/nvim/lsp.vim
