
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim' "bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete
" Plug 'chun-yang/auto-pairs' "autocomplete simbols
Plug 'morhetz/gruvbox' "theme
Plug 'xuyuanp/nerdtree-git-plugin' "nerdtree icons for Modified files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "nerdtree highlight
Plug 'ryanoasis/vim-devicons' "devicons
Plug 'scrooloose/nerdtree' "sarch gui files pressing cntrl-a to open it
Plug 'ctrlpvim/ctrlp.vim' "search gui files control-p search
Plug 'justinmk/vim-sneak' "Search values pressing s{char}{char}
Plug 'tpope/vim-surround' "change values example->cs()<{}
Plug 'tpope/vim-commentary' "comment with gcc
Plug 'shougo/unite.vim' "search buffer pattern
Plug 'terryma/vim-multiple-cursors' "<C-n> match and change 
Plug 'dkprice/vim-easygrep' "search <leader>vv
Plug 'rking/ag.vim' " search :Ag smt
Plug 'Shougo/vimproc.vim', {'do' : 'make'} "pattern match with unite

call plug#end()

" unite | easygrep | ag | vimproc
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
let g:unite_source_grep_recursive_opt = ''
nnoremap <Leader><Leader> :<C-u>Unite -no-split -silent -buffer-name=ag grep<CR>
" autocomplete problem
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" warning
let g:coc_disable_startup_warning = 1
"save and quit"
:nmap q :q<CR>
:nmap Q :q!<CR>
:nmap w :w<CR>
:nnoremap W :wq!<CR>
" set list
set listchars=eol:↓,space:·,trail:●,tab:→→,extends:>,precedes:<
" match list
":match GroupA / \t/
function! HighError()
	execute "highlight GroupA ctermbg=1.99 ctermfg=107 guibg=#87af57"
	execute "set list"
endfunction

:map <C-l> :call HighError()<CR>:match GroupA /\s\+$/<CR>

"open and colors list
"hi WarningMsg ctermbg=White ctermbg=red guifg=White guibg=Red gui=None
set wrap

" Faster Scrolling
:nnoremap <C-z> :tabp<CR> 
:map <C-c> :tabnew<CR> 
:nnoremap <C-x> :tabn<CR> 
:nnoremap J } 
:nnoremap K {
:nnoremap <C-j> }
:nnoremap <C-k> {
:nnoremap z 0<Esc> 
:vnoremap z 0
:nnoremap Z A<Esc>
:vmap Z $
:nnoremap L e
:nnoremap H b
"put ; on final line
:nnoremap ; $a;<Esc>
"copy word
:nnoremap y bvey
:nnoremap > >> 
:nnoremap < << 
:nnoremap <C-w>< 10<C-w><
:nnoremap <C-w>> 10<C-w>>
:nnoremap <C-w>+ 10<C-w>+
:nnoremap <C-w>- 10<C-w>-
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

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
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
    " silent au BufLeave <buffer> stopinsert!
    " silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q!<CR>"

  endif
 endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

set laststatus=2  "lightline set"
" set splitbelow "split horizontal below"
syntax on
colorscheme gruvbox
set background=dark
set number "see numbers"
set tabstop=4
set shiftwidth=4
set autoindent
set cursorline
set clipboard=unnamed "CTRL+V"
set clipboard=unnamedplus "CNTRL+C"
set numberwidth=2
set mouse=a "move mouse"
set path+=**
set wildmenu "search files menu"
set relativenumber "number moving"
set hlsearch "Highlights search terms"
set showmatch "Highlights matching parentheses"
