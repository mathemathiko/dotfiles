""""""""""""""""""""""
"" basic
""""""""""""""""""""""

set number
set whichwrap=b,s,h,l,>,[,]
set ai
set cursorline
set cursorcolumn
set notextmode
set encoding=utf-8
set fileencoding=utf-8
hi CursorLine guifg=NONE guibg=#505050

syntax on
set matchpairs=(:),{:},[:],<:>,":",':'
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

nnoremap ,r :source ~/.vimrc<CR>

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
"" folding
""""""""""""""""""""""

set foldlevel=100


""""""""""""""""""""""
"" space
""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=1
set backspace=start,eol,indent
set autoindent
set smartindent


""""""""""""""""""""""
"" status line
""""""""""""""""""""""

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
highlight Visual ctermbg=gray


""""""""""""""""""""""
"" tmux
""""""""""""""""""""""

set clipboard+=unnamed
set clipboard+=autoselect

""""""""""""""""""""""
"" key binding
""""""""""""""""""""""

nmap <Space>. :<C-u>edit $MYVIMRC<Enter>
nmap <Space>s. :<C-u>source $MYVIMRC<Enter>
nmap <C-h> :<C-u>help<Space>
nmap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" http://ivxi.hatenablog.com/entry/2013/05/23/163825
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bv :b#<CR>
nnoremap <silent>bf :bf<CR>
nnoremap <silent>bl :bl<CR>
nnoremap <silent>bm :bm<CR>
nnoremap <silent>bd :bdelete<CR>

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
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak',
  \   },
  \ }

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
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kg8m/vim-rubytest'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ornicar/vim-mru'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mathemathiko/vim-rails'
" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'erikw/tmux-powerline'
" NeoBundle 'milkbikis/powerline-shell'
" NeoBundle 'jeremyFreeAgent/oh-my-zsh-powerline-theme'
NeoBundle 'rking/ag.vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'mattn/zencoding-vim'
" NeoBundle 'mattn/emmet-vim'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'

" colorscheme
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vol2223/vim-colorblind-colorscheme'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
" NeoBundle 'buftabs'

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


" buftabs "{{{
" http://qiita.com/naonya3@github/items/4da9ff3e9f19e820026e
" omit path
" let g:buftabs_only_basename = 1
" display in statusline
" let g:buftabs_in_statusline = 1
" highlight
" let g:buftabs_active_highlight_group="Visual"
" }}}


" EnhCommentify "{{{
let g:EnhCommentifyBindInInsert = 'no'
" }}}


" gundo "{{{
nnoremap <F5> :GundoToggle<CR>
" }}}


" vim-markdown "{{{
let g:vim_markdown_folding_disabled=1
" }}}
"


" moin.vim "{{{
au BufNewFile,BufRead *.moin setf moin
au BufNewFile,BufRead *.trac setf moin
" }}}
"


"" neocomplcache.vim {{{
let g:neocomplcache_enable_at_startup = 1
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" :pumvisible() ?  "\<C-n>" : "\<TAB>"
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=11 ctermfg=0
hi PmenuSbar ctermbg=0
set pumheight=20
let g:Align_xstrlen = 3
"" }}}


"" powerline {{{
let g:Powerline_symbols = 'fancy'
"" }}}


"" quickrun.vim {{{
let g:quickrun_config = {}
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
let g:quickrun_config._ = {'runner' : 'vimproc'}
"" }}}


"" vim-rails {{{
" http://fg-180.katamayu.net/archives/2006/09/02/125150
let g:rails_default_database="mysql"
autocmd FileType ruby set path+=test/lib
let g:rails_level = 4
let g:rails_projections = {
  \   "app/controllers/shared/*.rb": {
  \     "test": [
  \       "test/functional/shared/%s_test.rb",
  \       "test/functional/shared/%s_tests.rb",
  \     ],
  \   },
  \   "app/helpers/*_builder.rb": {
  \     "command": "helper",
  \   },
  \   "app/models/finder/*_finder.rb": {
  \     "command": "finder",
  \     "test": [
  \       "test/unit/%s_finder_test.rb",
  \     ]
  \   },
  \   "spec/fabricators/*_fabricator.rb": {
  \     "command": "fabricator",
  \     "affinity": "model",
  \     "alternate": "app/models/%s.rb",
  \     "related": "db/schema.rb#%p",
  \     "test": "spec/models/%s_spec.rb",
  \   },
  \   "spec/support/*.rb": {
  \     "command": "support",
  \   },
  \ }
"" }}}


"" ruby-test.vim {{{
let g:no_rubytest_mappings="\""
let g:rubytest_cmd_test = "ruby %p"
let g:rubytest_cmd_testcase = "ruby %p -n %c"
"" }}}


"" svn-diff.vim {{{
nmap ,d :call SVNDiff()<CR>
function! SVNDiff()
  edit diff
  silent! setlocal ft=diff nobackup noswf buftype=nofile
  execute "normal :r!LANG=ja_JP.UTF8 svn diff\n"
  goto 1
endfunction
"" }}}


"" unite.vim {{{
" The prefix key.
" nnoremap    [unite]   <Nop>
" nmap    <Leader>f [unite]
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
noremap :ub :Unite buffer -buffer-name=buffer
noremap :uc :Unite colorscheme -auto-preview
noremap :ud :Unite directory -buffer-name=directory
noremap :uf :Unite file -buffer-name=file
noremap :ufr :Unite file_rec -buffer-name=file_rec
noremap :um :Unite file_mru -buffer-name=file_mru
noremap :uy :Unite history/yank -buffer-name=file_mru
 
" vinarise
let g:vinarise_enable_auto_detect = 1

" vim-versions
nnoremap <silent> ,uv :<C-u>UniteVersions status:!<CR>

" yank history
let g:unite_source_history_yank_enable =1
 
" unite-build map
" nnoremap <silent> ,vb :Unite build<CR>
" nnoremap <silent> ,vcb :Unite build:!<CR>
" nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}


"" unite-colorscheme.vim {{{
" let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 1
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap cs :<C-u>Unite colorscheme font<Cr>
endif
"" }}}
