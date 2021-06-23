if has('win64') || has('win32')
  set runtimepath+=~/.vim
endif

set directory=$HOME/.vim/swap//,$TEMP,c:/tmp,c:/temp

let mapleader = ','


call plug#begin('~/.vim/plug')

"colours
Plug 'altercation/vim-colors-solarized'

"sensible
"Plug 'tpope/vim-sensible'

"powertools
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'ctrlpvim/ctrlp.vim' ", { 'on': 'CtrlP' }
"Plug 'spf13/undotree'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
"Plug 'rosenfeld/conque-term'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf' ", { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('win64') || has('win32')
  Plug 'derekmcloughlin/gvimfullscreen_win32'
endif

"editing tools
Plug 'chrisbra/unicode.vim'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/ZoomWin'
Plug 'nelstrom/vim-visual-star-search'
"Plug 'YankRing.vim'
"Plug 'ack.vim'
"Plug 'rking/ag.vim' "is there a rg equivalent or can we just alias
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/paredit.vim'
"Plug 'Smart-Parentheses'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-speeddating'

"filetypes
"Plug 'tpope/vim-git', 'v6' "we're past 7.2
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-cucumber'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'clojure-vim/vim-cider'
"Plug 'tpope/vim-classpath'
Plug 'greyblake/vim-preview'
Plug 'bfrg/vim-jqplay'
Plug 'hashivim/vim-terraform'
Plug 'instant-markdown/vim-instant-markdown'

"TODO: figure out config
"Plug 'klen/python-mode'
"Plug 'nvie/vim-pyunit'
"Plug 'VimClojure'
"Plug 'hoffoo/vim-grails-console'
"Plug 'NathanNeff/grails-vim'
"Plug 'sjurgemeyer/vim-grails-import'

call plug#end()

" re-enable
filetype plugin indent on
syntax on

"non-standard file type detection
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead requirements*.txt set filetype=python
autocmd BufNewFile,BufRead Pipfile set filetype=config
autocmd BufNewFile,BufRead Pipfile.lock set filetype=json

"ctrl-p config
"let g:ctrlp_custom_ignore = { 'dir': '\v(node_modules|target)' }

"fzf config
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
let g:fzf_layout = { 'down': '15%' }
"let g:fzf_preview_window = [ 'right:50%', 'ctrl-;' ]

augroup fzf
  autocmd! FileType fzf
  autocmd FileType fzf set laststatus=0
  autocmd BufLeave <buffer> set laststatus=2
augroup end

"gvimfullscreen config
if has('win64') || has('win32')
  autocmd GUIEnter * call libcallnr(expand("$HOME/.vim/bundle/gvimfullscreen_win32/gvimfullscreen_64.dll"), "ToggleFullScreen", 0)
  nnoremap <silent> <Leader>F <Esc>:call libcallnr(expand("$HOME/.vim/bundle/gvimfullscreen_win32/gvimfullscreen_64.dll"), "ToggleFullScreen", 0)<CR>
endif

"syntastic config
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }

"paredit config
" let g:paredit_electric_return = 0

"yankring config
let g:yankring_min_element_length = 2
let g:yankring_window_use_horiz = 0
let g:yankring_window_width = 80

"ultisnips config
"set pythonthreedll=python37.dll

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

"grails config
"let g:ConqueTerm_ReadUnfocused = 1
"let g:ConqueTerm_CloseOnEnd = 1
"let g:ConqueTerm_CWInsert = 1
"let g:GrailsShellStartSplit = 1
"let g:GrailsShellReturnKey = "<C-CR>"
"let g:GrailsTestsBrowser = 'google-chrome --app=file://'
"autocmd BufEnter _grails_ set number
"autocmd BufEnter _grails_ set norelativenumber

"colours
colorscheme solarized

set background=dark

"UI tweaks
set number
set nowrap
set linebreak
set hidden
set laststatus=2

"quick drop out of INSERT
inoremap <C-j> <Esc>

"tabstop settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

"highlight special characters
set listchars=tab:»\ ,eol:¬,trail:¤,nbsp:°
"set list

"search settings
set nohlsearch
set incsearch

augroup vimrc-incsearch-highlight
  autocmd!
  au CmdlineEnter /,\? set hlsearch
  au CmdlineLeave /,\? set nohlsearch
augroup end

"lightline setting
set noshowmode
let g:lightline = {
      \  'colorscheme': 'solarized',
      \  'active': {
      \    'left': [ [ 'mode', 'paste', 'gitbranch' ],
      \              [ 'readonly', 'filename', 'modified', 'tag' ], ],
      \    'right': [ [ 'percent', 'lineinfo' ] ,
      \               [ 'filetype', 'fileencoding', 'fileformat' ] ,
      \               [ 'syntastic', 'gutentags' ] ]
      \  },
      \  'component_function': {
      \    'gitbranch': 'LightlineGitHead',
      \    'tag': 'CurrentTag',
      \    'gutentags': 'gutentags#statusline',
      \    'hlsearch': 'ShowHlsearch',
      \    'syntastic': 'SyntasticStatuslineFlag'
      \  }
      \}

function! CurrentTag()
  return tagbar#currenttag('%s', '', 'f', 'scoped-stl')
endfunction

set encoding=utf-8

function! LightlineGitHead()
  return fugitive#head() !=# '' ? "⌥ " . fugitive#head() : ''
endfunction

"tagbar settings
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0

set updatetime=1000

nnoremap <silent> <nowait> <Leader>t :TagbarToggle<CR>

"gutentags settings
let g:gutentags_cache_dir = '~/.vim/tags//'

"Preview settings
let g:PreviewBrowsers = 'google-chrome,firefox'

"NERDtree settings
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeQuitOnOpen = 3
let g:NERDTreeMapMenu = ';'
if has('win64') || has('win32')
  let g:NERDTreeDirArrowExpandable = "⯈"
  let g:NERDTreeDirArrowCollapsible = "⯆"
endif
nnoremap <silent> <nowait> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <nowait> <Leader>m :NERDTreeFind<CR>

"reset keyword lookup program to :help
set keywordprg=
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc

"custom keymapping
cnoremap w!! w !sudo tee % >/dev/null
cnoremap h<space> vert h<space>
