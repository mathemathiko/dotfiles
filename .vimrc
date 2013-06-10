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


""""""""""""""""""""""
"" neobundle
""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'sjl/gundo.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kg8m/svn-diff.vim'
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'kannokanno/unite-todo'
NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'choplin/unite-vim_hacks'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'kg8m/moin.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-haml'
" NeoBundle 'kg8m/vim-rubytest'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ornicar/vim-mru'

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


"" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
noremap :um :Unite file_mru -buffer-name=file_mru
noremap :ud :Unite directory -buffer-name=directory
noremap :uf :Unite file -buffer-name=file
noremap :ufr :Unite file_rec -buffer-name=file_rec
 
" vinarise
let g:vinarise_enable_auto_detect = 1
 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}


"" unite-colorscheme.vim {{{
" let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap cs :<C-u>Unite colorscheme font<Cr>
endif
"" }}}


"" quickrun.vim {{{
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"" }}}


"" neocomplcache.vim {{{
let g:neocomplcache_enable_at_startup = 1
"" }}}
