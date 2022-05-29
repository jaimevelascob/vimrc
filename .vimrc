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
Plug 'tpope/vim-commentary' "comment with gcc 

call plug#end()

"save and quit"
:nmap q :q<CR>
:nmap w :w<CR>

" Faster Scrolling
:nnoremap J } 
:nnoremap K {
:nnoremap <C-j> }
:nnoremap <C-k> {
:nnoremap z 0<Esc> 
:nnoremap Z A<Esc>
:nnoremap L e
:nnoremap H b
"put ; on final line
:nnoremap ; $a;<Esc>
"copy word
:nnoremap y bvey

"nerd three"
"Control a -> open"
:nmap <C-a> :NERDTree<CR>
"Close when Nerd is the las wdw"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"cancel Highlights
:nmap + :noh<CR><Esc>

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

set splitright
function! OpenTerminal()
  " move to right most buffer
  " move to right most buffer

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q!"
  else
    " open terminal
    execute "normal \<C-w>v"
    execute "term"
    execute "normal \<C-w>w"
    execute "q"
    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
 endfunction
nnoremap <C-t> :call OpenTerminal()<CR>


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
