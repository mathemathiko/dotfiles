" http://www.slideshare.net/cohama/vim-script-vimrc-nagoyavim-1
" http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation

""""""""""""""""""""""
"" optimize
""""""""""""""""""""""
" http://rhysd.hatenablog.com/entry/2012/12/19/001145
" http://mattn.kaoriya.net/software/vim/20120315221158.htm

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
" colorscheme molokai
" colorscheme jellybeans
" colorscheme hybrid
" colorscheme railscasts
" colorscheme rdark
" colorscheme vividchalk
" colorscheme zenburn
" colorscheme guardian
" colorscheme wombat
colorscheme kolor
" colorscheme gruvbox
" colorscheme bubblegum
" colorscheme lucius


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
"" browser
""""""""""""""""""""""

" enable to open browser from vim
" http://d.hatena.ne.jp/shunsuk/20110508/1304865150
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>w :call HandleURI()<CR>


""""""""""""""""""""""
"" neobundle
""""""""""""""""""""""

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundleLazy
" http://d.hatena.ne.jp/osyo-manga/20130211/1360582966

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
" http://qiita.com/rbtnn/items/600ac451ebb43b2c9c13
NeoBundleLazy 'Shougo/unite.vim' , {
\   'autoload' : { 'commands' : [ 'Unite' ] }
\ }
let s:bundle = neobundle#get('unite.vim')
function! s:bundle.hooks.on_source(bundle)
  NeoBundle 'kmnk/vim-unite-svn'
  NeoBundle 'basyura/unite-rails'
  " NeoBundle 'ujihisa/unite-colorscheme'
  " NeoBundle 'ujihisa/unite-font'
  " NeoBundle 'kannokanno/unite-todo'
  " NeoBundle 'mattn/unite-advent_calendar'
  " NeoBundle 'choplin/unite-vim_hacks'
  " NeoBundle 'h1mesuke/unite-outline'
  " NeoBundle 'pasela/unite-webcolorname'
endfunction
unlet s:bundle
" NeoBundle 'Shougo/unite.vim'

NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShellBufferDir' ] },
\   'depends': [ 'Shougo/vimproc' ],
\ }
let s:bundle = neobundle#get('vimshell')
function! s:bundle.hooks.on_source(bundle)
  " write vimshell settings here.
endfunction
unlet s:bundle
" NeoBundle 'Shougo/vimshell.vim'

if has('lua') && ( (v:version == 703 && has('patch885')) || v:version >= 704 )
  NeoBundle "Shougo/neocomplete"
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
else
  NeoBundle 'Shougo/neocomplcache'
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
endif

" http://qiita.com/hide/items/b0087bc0bbc36d0f91fb
NeoBundleLazy "Shougo/vimfiler", {
\   'autoload' : { 'commands' : [ 'VimFiler' ] },
\   'depends': [ 'Shougo/unite.vim' ],
\ }
NeoBundle 'sjl/gundo.vim'
" NeoBundle 'slim-template/vim-slim'
" XXX: OPTIMIZE
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kg8m/svn-diff.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'kg8m/moin.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kg8m/vim-rubytest'
NeoBundle 'plasticboy/vim-markdown'
" XXX: OPTIMIZE
" NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'hail2u/vim-css-syntax'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ornicar/vim-mru'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mathemathiko/vim-rails'
" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'erikw/tmux-powerline'
" NeoBundle 'milkbikis/powerline-shell'
" NeoBundle 'jeremyFreeAgent/oh-my-zsh-powerline-theme'
NeoBundle 'rking/ag.vim'
NeoBundle 'thinca/vim-qfreplace'
" XXX: OPTMIZE
" NeoBundle 'mattn/emmet-vim'
NeoBundle 'hrsh7th/vim-versions'
" XXX: OPTMIZE
" NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'tpope/vim-endwise'
" XXX: OPTMIZE
" NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'kana/vim-smartchr'
" XXX: OPTMIZE
" NeoBundle 'lilydjwg/colorizer'
NeoBundle 'vim-ruby/vim-ruby'
" XXX: OPTMIZE
" NeoBundle 'tsaleh/vim-matchit'
" XXX: OPTMIZE
" NeoBundle 'ecomba/vim-ruby-refactoring'
" NeoBundle 'tell-k/vim-browsereload-mac'
" NeoBundle 'scrooloose/syntastic'
" XXX: OPTIMIZE
" NeoBundle 'nishigori/vim-sunday'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'mattn/benchvimrc-vim'

" colorscheme
" NeoBundle 'tomasr/molokai'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'vol2223/vim-colorblind-colorscheme'
" NeoBundle 'Guardian'
" NeoBundle 'mathemathiko/vim-vividchalk'
" NeoBundle 'Zenburn'
" NeoBundle 'Wombat'
NeoBundle 'zeis/vim-kolor'
" NeoBundle 'morhetz/gruvbox'
" NeoBundle 'baskerville/bubblegum'
" NeoBundle 'jonathanfilip/vim-lucius'

" vim-scripts repos
" XXX: OPTIMIZE
" NeoBundle 'L9'
" XXX: OPTIMIZE
" NeoBundle 'FuzzyFinder'
NeoBundle 'EnhCommentify.vim'
" NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
" NeoBundle 'buftabs'
NeoBundle 'teol.vim'

" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'

" Non git repos
" XXX: OPTIMIZE
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.


""""""""""""""""""""""
"" plugin
""""""""""""""""""""""

" vim-anzu "{{{
" nmap n <Plug>(anzu-n)
" nmap N <Plug>(anzu-N)
" nmap * <Plug>(anzu-star)
" nmap # <Plug>(anzu-sharp)
" augroup vim-anzu
" NOT display at particular time
"   autocmd!
"   autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
" augroup END
" }}}


" buftabs "{{{
" http://qiita.com/naonya3@github/items/4da9ff3e9f19e820026e
" omit path
" let g:buftabs_only_basename = 1
" display in statusline
" let g:buftabs_in_statusline = 1
" highlight
" let g:buftabs_active_highlight_group="Visual"
" }}}


" clever-f.vim "{{{
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_chars_match_any_signs = ';'
" }}}


" EnhCommentify "{{{
let g:EnhCommentifyBindInInsert = 'no'
" }}}


"" gruvbox {{{
" map <F5> :call ToggleBg()<CR>
" function! ToggleBg()
"     if &background == 'dark'
"         set bg=light
"     else
"         set bg=dark
"     endif
" endfunction
" set bg=dark
"" }}}


" gundo "{{{
nnoremap <F5> :GundoToggle<CR>
" }}}


" lightline "{{{
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
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
" let g:Powerline_symbols = 'fancy'
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
"" }}}


"" ruby-test.vim {{{
let g:no_rubytest_mappings="\""
let g:rubytest_cmd_test = "ruby %p"
let g:rubytest_cmd_testcase = "ruby %p -n %c"
"" }}}


"" sunday.vim {{{
" let g:sunday_pairs = [
"   \   ['active', 'inactive'],
"   \ ]
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
" let g:unite_enable_split_vertically = 1
" if globpath(&rtp, 'plugin/unite.vim') != ''
"   nnoremap cs :<C-u>Unite colorscheme font<Cr>
" endif
"" }}}


"" unite-outline.vim {{{
" http://hinagishi.hateblo.jp/entry/2011/11/18/135701
" noremap :uo :Unite -vertical -winwidth=40 -no-quit outline
"" }}}


"" unite-rails.vim {{{
" http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb#2-9
" https://gist.github.com/alpaca-tc/4521467
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H> :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H> :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H> :<C-U>Unite rails/controller<CR>
   
  nnoremap <buffer><C-H>c :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"" }}}
