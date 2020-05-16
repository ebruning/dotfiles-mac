call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'cocopon/iceberg.vim'

" Youtube
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'

Plug 'christoomey/vim-tmux-navigator'

" Status Line
Plug 'itchyny/lightline.vim'

call plug#end()

" vim settinga
colorscheme iceberg

if !has('gui_running')
  set t_Co=256
endif

set encoding=utf-8
set number
set background=dark
set laststatus=2
set nocompatible                
set encoding=utf-8
set nobackup
set noswapfile
set splitright
set splitbelow
set noshowmode  " Don't show mode since using status line
set hidden
set cmdheight=2

" MacVim specific settings
if has("gui_macvim")
  set guifont=Hack\ Nerd\ Font:h14
endif

" Commenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Nerd Tree
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",  
    "\ "Ignored"   : "#808080"  
    "\ }                        

let g:NERDTreeIgnore = ['^node_modules$']

" CTRL-P
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Lightline
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ }

"
"let g:coc_node_path ='/Users/ethan/.nvm/versions/node/v10.16.0/bin/node'
