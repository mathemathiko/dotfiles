""""""""""""""""""""""
"" basic
""""""""""""""""""""""

set number
set whichwrap=b,s,h,l,>,[,]
set ai
set cursorline
set cursorcolumn
set encoding=utf-8
set fileencoding=utf-8
hi CursorLine guifg=NONE guibg=#505050

syntax on
set showmatch
set showmode
set showcmd
set title
set ruler
set cmdheight=2
set laststatus=2

syntax enable
set t_Co=256
set nocompatible               " Be iMproved

""""""""""""""""""""""
"" color
""""""""""""""""""""""

" colorscheme delek
" colorscheme solarized
colorscheme molokai
" colorscheme jellybeans
" colorscheme hybrid
" colorscheme railscasts
" colorscheme rdark


""""""""""""""""""""""
"" neobundle
""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" colorscheme
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vol2223/vim-colorblind-colorscheme'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'

" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'

" Non git repos
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.

""""""""""""""""""""""
"" search
""""""""""""""""""""""

set hlsearch
set noignorecase

set wildmenu
set incsearch


""""""""""""""""""""""
"" space
""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=1
set backspace=start,eol,indent
set autoindent


""""""""""""""""""""""
"" key binding
""""""""""""""""""""""

nmap <Space>. :<C-u>edit $MYVIMRC<Enter>
nmap <Space>s. :<C-u>source $MYVIMRC<Enter>
nmap <C-h> :<C-u>help<Space>
nmap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
map ; :
map j gj
map k gk
