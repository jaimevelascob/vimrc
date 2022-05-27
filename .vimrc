call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim' "bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete
Plug 'chun-yang/auto-pairs' "autocomplete simbols
Plug 'morhetz/gruvbox' "theme 
Plug 'xuyuanp/nerdtree-git-plugin' "nerdtree icons for Modified files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "nerdtree highlight
Plug 'ryanoasis/vim-devicons' "devicons
Plug 'scrooloose/nerdtree' "sarch gui files pressing cntrl-a to open it  
Plug 'ctrlpvim/ctrlp.vim' "search gui files control-p search
Plug 'justinmk/vim-sneak' "Search values pressing s{char}{char}
Plug 'tpope/vim-surround' "change values example->cs()<{}

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
