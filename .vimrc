call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' "search  
Plug 'itchyny/lightline.vim' "bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete
Plug 'morhetz/gruvbox' "theme
Plug 'justinmk/vim-sneak' "Seach
Plug 'chun-yang/auto-pairs' "autocomplete ()
Plug 'ryanoasis/vim-devicons' "devicons
Plug 'xuyuanp/nerdtree-git-plugin' "nerdtree icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "nerdtree highlight

call plug#end()

"save and quit"
:nmap q :q
:nmap w :w
"nerd three"
"Control a -> open"
:nmap <C-a> :NERDTree<CR>
"Close when Nerd is the las wdw"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"cancel Highlights
:nmap ` :noh<CR>
set encoding=UTF-8
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:sneak#label = 1 "command on search with s 

set laststatus=2  "lightline set"
syntax on
colorscheme gruvbox
set background=dark
set number "see numbers"
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set clipboard=unnamed "CTRL+V"
set clipboard=unnamedplus "CNTRL+C"
set numberwidth=2
set mouse=a "move mouse"
set path+=**
set wildmenu "search files menu"
set relativenumber "number moving"
set hlsearch "Highlights search terms"
set showmatch "Highlights matching parentheses"
