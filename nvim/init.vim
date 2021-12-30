"install plug-vim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Appearence {{{ "
Plug 'itchyny/lightline.vim'		" Status line
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Side bars{{{
Plug 'scrooloose/nerdtree'		" NERD Tree
Plug 'Xuyuanp/nerdtree-git-plugin' 	" show git status in Nerd tree
"Plug 'mbbill/undotree'
"Plug 'preservim/tagbar'
" }}}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " Completion as in vscode

"JS {{{
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier'
Plug 'dense-analysis/ale' "ES-Lint
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx','typescript'],  'do': 'make install' }
Plug 'honza/vim-snippets'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
"Plug 'SirVer/ultisnips'
Plug 'albanm/vuetify-vim'
"}}}

" Markdown {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"}}}

" GIT {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

Plug 'ryanoasis/vim-devicons' " icons
Plug 'ap/vim-css-color'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" vim settinga
colorscheme gruvbox

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
set cmdheight=1

" NerdTree start
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
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
let NERDTreeBookmarksFile=expand("$HOME/.config/nvim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=1
" NerdTree end

" auto folds
"let g:coc_global_extensions = [
"  \ 'coc-snippets',
"  \ 'coc-pairs',
"  \ 'coc-tsserver',
"  \ 'coc-eslint', 
"  \ 'coc-html', 
"  \ 'coc-css', 
"  \ 'coc-prettier', 
"  \ 'coc-json', 
"  \ 'coc-emoji',
"  \ ]

" ctrl-space FZF
nnoremap <c-space> :FZF<CR>

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" coc config
" ======
" use tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"use enter to confirm completion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" vim-startify start
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.config/nvim/NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ ]
" vim-startify end
