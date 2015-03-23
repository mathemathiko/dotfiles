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
" http://d.hatena.ne.jp/osyo-manga/20140303/1393854617
augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END
set whichwrap=b,s,h,l,>,[,]
set ai
set cursorline
set cursorcolumn
set notextmode
set encoding=utf-8
set fileencoding=utf-8
set ttyfast
set clipboard+=unnamed
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
" colorscheme kolor
" colorscheme gruvbox
" colorscheme bubblegum
" colorscheme lucius
colorscheme solarized
" colorscheme monokai

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

set foldmethod=manual
" set foldlevel=1

" autocmd FileType ruby :set foldmethod=indent
" autocmd FileType ruby :set foldlevel=1
" autocmd FileType ruby :set foldnestmax=2


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
"" task list
""""""""""""""""""""""

command! Tm edit ~/Desktop/note/work/task/201503.md

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

" map ; :
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
  " http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
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

" NeoBundleLazy 'Shougo/vimshell', {
" \   'autoload' : { 'commands' : [ 'VimShellBufferDir' ] },
" \   'depends': [ 'Shougo/vimproc' ],
" \ }
" let s:bundle = neobundle#get('vimshell')
" function! s:bundle.hooks.on_source(bundle)
"   " write vimshell settings here.
" endfunction
" unlet s:bundle
" NeoBundle 'Shougo/vimshell.vim'

" http://blog.basyura.org/entry/2013/08/17/154700
if has('lua')
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

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
  inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"
  inoremap <expr><C-c>  neocomplete#cancel_popup()
  inoremap <expr><C-u>  neocomplete#undo_completion()
  inoremap <expr><C-e>  neocomplete#close_popup()
  inoremap <expr><C-l>  neocomplete#complete_common_string()

  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
endif

" http://qiita.com/hide/items/b0087bc0bbc36d0f91fb
NeoBundleLazy "Shougo/vimfiler", {
\   'autoload' : { 'commands' : [ 'VimFiler' ] },
\   'depends': [ 'Shougo/unite.vim' ],
\ }
NeoBundleLazy 'sjl/gundo.vim', {
\   'autoload' : { 'commands' : [ 'GundoToggle' ] }
\ }

" NeoBundle 'slim-template/vim-slim'
" XXX: OPTIMIZE
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kg8m/svn-diff.vim'
" NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundleLazy 'jelera/vim-javascript-syntax', {
            \   'autoload': {
            \     'filetypes': ['javascript'],
            \     'functions': ['JavaScriptFold'],
            \   },
            \ },
NeoBundle 'mxw/vim-jsx'
" XXX: trac wiki syntax highlight
" XXX: http://qiita.com/wonderful_panda/items/449833fa90cc5b5c13c0
NeoBundle 'kg8m/moin.vim'
" NeoBundle 'ujihisa/neco-look'
NeoBundleLazy 'Shougo/neosnippet', {
\   'autoload' : { 'insert': 1 }
\ }
let s:bundle = neobundle#get('neosnippet')
function! s:bundle.hooks.on_source(bundle)
  NeoBundle 'Shougo/neosnippet-snippets'

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets,~/.vim/snippets/snippets'
  " autocmd BufEnter * if exists("b:rails_root") | NeoComplCacheSetFileType ruby.rails | endif
endfunction
unlet s:bundle

" XXX: http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
NeoBundle 'tpope/vim-surround'
" NeoBundle 'tpope/vim-haml'
NeoBundle 'kg8m/vim-rubytest'
NeoBundle 'plasticboy/vim-markdown'
" XXX: NOT OPTIMIZE
NeoBundle 'Lokaltog/vim-easymotion'
" XXX: https://github.com/rstacruz/sparkup#examples
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
" NeoBundle 'erikw/tmux-powerline'
" NeoBundle 'milkbikis/powerline-shell'
" NeoBundle 'jeremyFreeAgent/oh-my-zsh-powerline-theme'
" XXX: http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/
NeoBundle 'rking/ag.vim'
" XXX: http://archiva.jp/web/tool/vim_grep2.html
NeoBundle 'thinca/vim-qfreplace'
" XXX: OPTMIZE
" NeoBundle 'mattn/emmet-vim'
" NeoBundle 'hrsh7th/vim-versions'
" XXX: OPTMIZE
" NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'mattn/webapi-vim'
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'tpope/vim-endwise'
" XXX: OPTMIZE
" NeoBundle 'osyo-manga/vim-anzu'
" NeoBundle 'kana/vim-smartchr'
" XXX: OPTMIZE
" NeoBundle 'lilydjwg/colorizer'
NeoBundle 'vim-ruby/vim-ruby'
" XXX: NOT OPTMIZE
" NeoBundle 'tsaleh/vim-matchit'
if !exists('loaded_matchit')
  " enable matchit.vim
  runtime macros/matchit.vim
endif
" XXX: OPTMIZE
" NeoBundle 'ecomba/vim-ruby-refactoring'
" NeoBundle 'tell-k/vim-browsereload-mac'
" NeoBundle 'scrooloose/syntastic'
" XXX: OPTIMIZE
" NeoBundle 'nishigori/vim-sunday'
" NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'mattn/benchvimrc-vim'
" NeoBundle 'alpaca-tc/alpaca_complete',{
"       \ 'depends' : ['tpope/vim-rails', 'Shougo/neocomplete'],
"       \ 'build' : {
"       \     'mac' : 'gem install alpaca_complete',
"       \     'unix' : 'gem install alpaca_complete',
"       \ }}
" XXX: http://blog.ruedap.com/2011/02/02/vim-ruby-regexp-plugin-eregex
NeoBundle 'othree/eregex.vim'
" XXX: https://github.com/AndrewRadev/switch.vim#builtins
NeoBundle 'AndrewRadev/switch.vim'
" NeoBundle 'LeafCage/yankround.vim'
" NeoBundle 'mattn/gist-vim'
" XXX: http://d.hatena.ne.jp/vimtaku/20121117/1353138802
" XXX: http://4uing.logdown.com/posts/146220-vim-alignta
NeoBundle 'h1mesuke/vim-alignta'
" NeoBundle 'kakkyz81/evervim'
" NeoBundle 'szw/vim-tags'
NeoBundle 'AndrewRadev/splitjoin.vim'
" https://github.com/osyo-manga/vim-over#screencapture
NeoBundle 'osyo-manga/vim-over'
" NeoBundle 'kana/vim-submode'
" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'joeytwiddle/sexy_scroller.vim'
" NeoBundle 't9md/vim-foldtext'
" XXX: https://github.com/justinmk/vim-sneak#usage-default
" XXX: interference with other plugins
" NeoBundle 'justinmk/vim-sneak'

" colorscheme
" NeoBundle 'tomasr/molokai'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vol2223/vim-colorblind-colorscheme'
" NeoBundle 'Guardian'
" NeoBundle 'mathemathiko/vim-vividchalk'
" NeoBundle 'Zenburn'
" NeoBundle 'Wombat'
" NeoBundle 'zeis/vim-kolor'
" NeoBundle 'morhetz/gruvbox'
" NeoBundle 'baskerville/bubblegum'
" NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'altercation/vim-colors-solarized'
" XXX: for printing
" NeoBundle 'hail2u/h2u_colorscheme'
" NeoBundle 'sickill/vim-monokai'

" vim-scripts repos
" XXX: OPTIMIZE
" NeoBundle 'L9'
" XXX: OPTIMIZE
" NeoBundle 'FuzzyFinder'
NeoBundle 'EnhCommentify.vim'
" NeoBundle 'taglist.vim'
" XXX: http://nanasi.jp/articles/vim/sudo_vim.html
" NeoBundle 'sudo.vim'
" NeoBundle 'buftabs'
" XXX: http://nanasi.jp/articles/vim/teol_vim.html
" NeoBundle 'teol.vim'
" NeoBundle 'YankRing.vim'
" XXX: http://qiita.com/0829/items/ce92a752bf832a06bcf2
" NeoBundle 'dbext.vim'

" Non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'

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
" let g:clever_f_smart_case = 1
" let g:clever_f_fix_key_direction = 1
" let g:clever_f_chars_match_any_signs = ';'
" }}}


" easymotion "{{{
" http://haya14busa.com/mastering-vim-easymotion/
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
" }}}


" EnhCommentify "{{{
let g:EnhCommentifyBindInInsert = 'no'
" }}}


" eregex.vim "{{{
nnoremap ,/ :M/
nnoremap ,? :M?
"" call Explore only E; to prevent ambiguous command with E2v
command! E :Explore
" }}}


" ever.vim "{{{
" pyhton-markdown must be installed.
" http://pythonhosted.org/Markdown/install.html

" WARNING: devtoken must be written in .vimrc.
" let g:evervim_devtoken='S=s44:U=46453f:E=14af0f077aa:C=143993f4bae:P=1cd:A=en-devtoken:V=2:H=8eb7a4a07fadf0b615a2abd883e5b815'
" let g:evervim_usemarkdown=1
" }}}


" gist.vim "{{{
" let g:gist_use_password_in_gitconfig = 1
" let g:gist_clip_command = 'pbcopy'
" let g:gist_open_browser_after_post = 1
" let g:gist_detect_filetype = 1
" let g:gist_show_privates = 1
" let g:gist_post_private = 1
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
" nmap U :<C-u>GundoToggle<CR>
" }}}


" jsx "{{{
let g:jsx_ext_required = 0
" }}}


" lightline "{{{
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ], [ 'buflist' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
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
      \   'buflist': 'Mline_buflist',
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

let g:mline_buflist_queue = []
let g:mline_buflist_limit = 4
let g:mline_buflist_exclution_pat = '^$\|.jax$\|vimfiler:\|\[unite\]\|tagbar'
let g:mline_buflist_enable = 1
command! Btoggle :let g:mline_buflist_enable = g:mline_buflist_enable ? 0 : 1 | :redrawstatus!
 
function! Mline_buflist()
    if &filetype =~? 'unite\|vimfiler\|tagbar' || !&modifiable || len(g:mline_buflist_queue) == 0 || g:mline_buflist_enable == 0
        return ''
    endif
 
    let current_buf_nr = bufnr('%')
    let buf_names_str = ''
    let last = g:mline_buflist_queue[-1]
    for i in g:mline_buflist_queue
        let t = fnamemodify(i, ':t')
        let n = bufnr(t)
 
        if n != current_buf_nr
            let buf_names_str .= printf('[%d]:%s' . (i == last ? '' : ' | '), n, t)
        endif
    endfor
 
    return buf_names_str
endfunction

function! s:update_recent_buflist(file)
    if a:file =~? g:mline_buflist_exclution_pat
        " exclusion from queue
        return
    endif
 
    if len(g:mline_buflist_queue) == 0
        " init
        for i in range(min( [ bufnr('$'), g:mline_buflist_limit + 1 ] ))
            let t = bufname(i)
            if bufexists(i) && t !~? g:mline_buflist_exclution_pat
                call add(g:mline_buflist_queue, fnamemodify(t, ':p'))
            endif
        endfor
    endif
 
    " update exist buffer
    let idx = index(g:mline_buflist_queue, a:file)
    if 0 <= idx
        call remove(g:mline_buflist_queue, idx)
    endif
 
    call insert(g:mline_buflist_queue, a:file)
 
    if g:mline_buflist_limit + 1 < len(g:mline_buflist_queue)
        call remove(g:mline_buflist_queue, -1)
    endif
endfunction
 
augroup general
    autocmd!
    autocmd TabEnter,BufWinEnter * call s:update_recent_buflist(expand('<amatch>'))
augroup END
" }}}


" vim-markdown "{{{
let g:vim_markdown_folding_disabled=1
" }}}
"


" moin.vim "{{{
au BufNewFile,BufRead *.moin setf moin
au BufNewFile,BufRead *.trac setf moin
" }}}


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


" sexy_scroller.vim "{{{
let g:SexyScroller_ScrollTime = 10
let g:SexyScroller_MaxTime = 500
let g:SexyScroller_EasingStyle = 2
"" }}}


"" vim-shell {{{
" nnoremap :sh :VimShellBufferDir
"" }}}


" simple-javascript-indenter "{{{
let g:SimpleJsIndenter_BriefMode = 2
let g:SimpleJsIndenter_CaseIndentLevel = -1
" }}}


"" solarized {{{
" I use xterm-256color as my terminfo on tmux 1.7 & Terminal.app on OS X Lion, so enable termtrans by manually.
" see https://github.com/altercation/vim-colors-solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
set background=dark
"" }}}


"" splitjoin {{{
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
"" }}}


"" vim-submode {{{
" http://haya14busa.com/improve-x-with-vim-submode/
" function! s:my_x()
"   undojoin
"   normal! "_x
" endfunction
" nnoremap <silent> <Plug>(my-x) :<C-u>call <SID>my_x()<CR>
" call submode#enter_with('my_x', 'n', '', 'x', '"_x')
" call submode#map('my_x', 'n', 'r', 'x', '<Plug>(my-x)')
"" }}}


"" sunday.vim {{{
" let g:sunday_pairs = [
"   \   ['active', 'inactive'],
"   \ ]
"" }}}


"" svn-diff.vim {{{
nmap <Leader>d :call SVNDiff()<Cr>
function! SVNDiff()
  edit diff
  silent! setlocal ft=diff bufhidden=delete nobackup noswf nobuflisted wrap buftype=nofile
  execute "normal :r!svn diff\n"
endfunction
"" }}}


"" switch.vim {{{
nnoremap - :Switch<cr>
"" }}}


"" vim-tags {{{
" let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
" let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
"" }}}


"" unite.vim {{{
" The prefix key.
" nnoremap    [unite]   <Nop>
" nmap    <Leader>f [unite]

let g:unite_source_menu_menus = {
      \   "evernote" : {
      \       "description" : "unite-evernote-menu",
      \       "command_candidates" : [
      \           ["notebook list",   "EvervimNotebookList"],
      \       ],
      \   },
      \   "gist" : {
      \       "description" : "unite-gist-menu",
      \       "command_candidates" : [
      \           ["my gists",   "Gist -l mathemathiko"],
      \           ["create private gist",  "Gist -p"],
      \           ["edit gist",  "Gist -e"],
      \       ],
      \   },
      \   "task" : {
      \       "description" : "unite-task-menu",
      \       "command_candidates" : [
      \           ["my task",   "Tm"],
      \       ],
      \   },
      \}
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap Um :<C-u>Unite menu<CR>
nnoremap Ug :<C-u>Unite menu:gist<CR>
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

"qfreplace
nnoremap ,ug :<C-u>Unite grep:./::

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
  nnoremap <buffer><C-H><C-H> :<C-U>Unite rails/controller<CR>
  nnoremap <buffer><C-H> :<C-U>Unite rails/model<CR>
   
  nnoremap <buffer><C-H>c :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>m :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><C-H>p :<C-U>Unite rails/public<CR>
  nnoremap <buffer><C-H>s :<C-U>Unite rails/script<CR>
  nnoremap <buffer><C-H>t :<C-U>Unite rails/test<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"" }}}


"" vimfiler {{{
" nnoremap :vf :VimFiler
"" }}}


"" YankRing {{{
" nmap ,y :YRShow<CR>
"" }}}


"" yankround {{{
" nmap p <Plug>(yankround-p)
" nmap P <Plug>(yankround-P)
" nmap gp <Plug>(yankround-gp)
" nmap gP <Plug>(yankround-gP)
" nmap <C-p> <Plug>(yankround-prev)
" nmap <C-n> <Plug>(yankround-next)
"" }}}
