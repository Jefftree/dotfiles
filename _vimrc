set nocompatible
filetype off "Figure out what this does
behave mswin
set encoding=utf-8
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread

" Leader to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"
let g:localleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" Share clipboard
set clipboard=unnamed



" Start vim split window
" au VimEnter * vsplit

"Markdown support
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'               " Package manager

" Interface
Plugin 'flazz/vim-colorschemes'          " List of common color themes
Plugin 'bling/vim-airline'               " Status bar
Plugin 'airblade/vim-gitgutter'          " Gitgutter
Plugin 'kien/rainbow_parentheses.vim'    " double rainbow?? (yeah idk)
Plugin 'mhinz/vim-startify'              " More useful startup page

" Functionality
Plugin 'kien/ctrlp.vim'                  " File searcher
Plugin 'godlygeek/tabular'               " Easy alignment of variables
Plugin 'scrooloose/nerdtree'             " File explorer
Plugin 'tpope/vim-fugitive'              " Git
Plugin 'Raimondi/delimitMate'            " Matching parentheses
Plugin 'nathanaelkane/vim-indent-guides' " Indent visuals (TODO: does this do anything)
Plugin 'tpope/vim-speeddating'           " <C-a>, <C-x> for dates
Plugin 'tpope/vim-surround'              " Surround shortcuts
Plugin 'ervandew/supertab'               " Tab Completion
Plugin 'scrooloose/syntastic'            " Syntax errors

" Language specific
Plugin 'derekwyatt/vim-scala'            " Scala support
Plugin 'plasticboy/vim-markdown'         " Markdown support
Plugin 'jelera/vim-javascript-syntax'    " Javascript Highlighting
Plugin 'vim-pandoc/vim-pandoc'           " Pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'    " Pandoc Syntax
Plugin 'klen/python-mode'                " Python

call vundle#end()

" Tabularize shortcut
if exists("Tabularize")
    map <Leader>a= :Tabularize /=<CR>
    map <Leader>a: :Tabularize /:<CR>
    map <Leader>a" :Tabularize /"<CR>
endif

let g:ctrlp_cache_dir = $USERPROFILE . '/.cache/ctrlp'

" ctrl-p use ag instead of default searching
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
  let g:ctrlp_use_caching = 0
endif

" Disable folding for Markdown
let g:vim_markdown_folding_disabled=1

" Shortcut to enable Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Airline tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#buffer_idx_mode = 1	" display numbers in the tab line, and use mappings <leader>1 to <leader>9

" Remove these lines soon. 
" hi CursorLine term=bold cterm=bold
" highlight Cursor guifg=black
",highlight iCursor guifg=black

" startify
let g:startify_session_persistence = 0		" automatically update sessions
let g:startify_session_delete_buffers = 1	" delete open buffers before loading a new session
let g:startify_custom_footer = [
	\ '',
	\ '    b   ➤ open in new buffer  :SLoad   ➤ load a session     ',
	\ '    s,v ➤ open in split       :SSave   ➤ save a session     ',
	\ '    t   ➤ open in tab         :SDelete ➤ delete a session   ',
	\ '',
	\ ]

" This still does jack
let g:startify_custom_header =
      \ map(split(system('fortune'), '\n'), '"   ". v:val') + ['']

" Startify shortcut
nmap <leader>h :Startify<CR>

" pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby", "scala", "literatehaskell=lhaskell", "bash=sh","json=javascript","css","html","javascript","c","cpp"]
let g:pandoc#syntax#conceal#blacklist = ["list","atx"]
      
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Python-mode
" Activate rope
" Keys
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ["pyflakes"]
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let NERDTreeIgnore=['^node_modules$', '^coverage$']

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

" Enable filetype plugins
filetype plugin indent on

au BufEnter *.c compiler gcc

  " Highlight TODO, FIXME, NOTE, etc.
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI/UX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dark scheme, only for terminal
set background=dark

" Enable syntax highlighting
syntax enable

set wildmenu " Wild menu expands autocompletion stuff in cmd mode for tab navigation
set wildignore=*.o,*~,*.pyc " Ignore compiled files

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Allow switching buffers before saving
set hidden

" TODO: Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


set ignorecase " ignore case when searching
set smartcase  " case-sensitive if uppercase search


set hlsearch   " Highlight search results
set incsearch  " Show search matches as you type

"TODO:  For regular expressions turn magic on. DAFUQ is magic?
" set magic

" Show matching brackets when text indicator is over them
set showmatch

" don't wrap lines
set nowrap

"TODO: Experimental: relative line number
set number
" set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>

" Highlight cursor line
set cursorline

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set shortmess+=I "No annoying startup message

" Don't let cursor be near vertical edge of screen
set scrolloff=10

" Show last command
set showcmd

" don't show current mode
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Quick access to vimrc
nmap <leader>v :e $MYVIMRC<CR>
nmap <leader>b :e $MYGVIMRC<CR>

" Apply vimrc changes without restart
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Start in desired directory
cd W:/

" Easy buffer navigation using tabs
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"Close buffer
nnoremap Q :bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map space to colon
noremap <space> :

" jj mapped to Esc
imap jj <Esc>

" jk mapped to Esc
imap jk <Esc>

" Center screen when searching and jumping
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" Consistent yanking
nnoremap Y y$

" Windows navigation shortcut
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv


" TODO: Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
