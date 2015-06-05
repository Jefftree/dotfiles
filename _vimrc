set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

set timeoutlen=300                                  "mapping timeout
set ttimeoutlen=50                                  "keycode timeout
set nofoldenable                                    "disable folding
set mouse=a                                         "enable mouse
set mousehide                                       "hide when characters are typed
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
set encoding=utf-8                                  "set encoding for text
set hidden                                          "allow buffer switching without saving
set autoread                                        "auto reload if file saved externally
set fileformats+=mac                                "add mac to auto-detection of file format line endings
set nrformats-=octal                                "always assume decimal numbers
set showcmd                                         "always show last used command
set autochdir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off " Required by vundle

if (has('win32') || has('win64'))
    set rtp+=~/.vim
    set rtp+=~/.vim/bundle/vimproc.vim
endif
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/Vundle.vim'               " Package manager

" Interface
NeoBundle 'flazz/vim-colorschemes'          " List of common color themes
NeoBundle 'bling/vim-airline'               " Status bar
NeoBundle 'airblade/vim-gitgutter'          " Gitgutter
NeoBundle 'kien/rainbow_parentheses.vim'    " double rainbow??
NeoBundle 'mhinz/vim-startify'              " More useful startup page
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-colorscheme-switcher'

" Utilities
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build': {
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
        \ 'windows': 'mingw32-make -f make_mingw32.mak',
      \ },
    \ }

"}}}
" Functionality
NeoBundle 'kien/ctrlp.vim'                  " File searcher
NeoBundle 'godlygeek/tabular'               " Easy alignment of variables
NeoBundle 'scrooloose/nerdtree'             " File explorer
NeoBundle 'tpope/vim-fugitive'              " Git
NeoBundle 'Raimondi/delimitMate'            " Matching parentheses
NeoBundle 'nathanaelkane/vim-indent-guides' " Indent visuals (TODO: does this do anything)
NeoBundle 'tpope/vim-speeddating'           " <C-a>, <C-x> for dates
NeoBundle 'tpope/vim-surround'              " Surround shortcuts
NeoBundle 'ervandew/supertab'               " Tab Completion
NeoBundle 'scrooloose/syntastic'            " Syntax errors
NeoBundle 'majutsushi/tagbar'               " Tag browsing
NeoBundle 'scrooloose/nerdcommenter'        " Commenting shortcuts
NeoBundle 'rking/ag.vim'                    " Searcher

" Language specific
NeoBundle 'derekwyatt/vim-scala'            " Scala support
NeoBundle 'plasticboy/vim-markdown'         " Markdown support
NeoBundle 'jelera/vim-javascript-syntax'    " Javascript Highlighting
NeoBundle 'klen/python-mode'                " Python
NeoBundle 'vim-pandoc/vim-pandoc'           " Pandoc
NeoBundle 'vim-pandoc/vim-pandoc-syntax'    " Pandoc Syntax
NeoBundle 'elzr/vim-json'                   " JSON Highlighting

NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}} "{{{
    nnoremap <silent> <leader>gv :Gitv<CR>
    nnoremap <silent> <leader>gV :Gitv!<CR>
"}}}

NeoBundle 'Shougo/unite.vim' "{{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
              \ 'start_insert': 1
              \ })
let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif

"call vundle#end()
call neobundle#end()
filetype plugin indent on
NeoBundleCheck " Check for missing plugins on startup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize shortcut
if exists("Tabularize")
    map <Leader>a= :Tabularize /=<CR>
    map <Leader>a: :Tabularize /:<CR>
    map <Leader>a" :Tabularize /"<CR>
endif

" CTRL-P
let g:ctrlp_cache_dir = $USERPROFILE . '/.cache/ctrlp'
let g:ctrlp_reuse_window='startify'
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|idea)|node_modules|coverage)$'
let g:ctrlp_max_height=5
let g:ctrlp_max_files=20000
let g:ctrlp_show_hidden=0

" ctrl-p use ag instead of default searching
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
endif

" Disable folding for Markdown
let g:vim_markdown_folding_disabled=1

" Shortcut to enable Nerdtree
let NERDTreeQuitOnOpen=0
let NERDTreeIgnore=['\.git','\.hg']
nnoremap <F2> :NERDTreeToggle<CR>

" Colorscheme terminal fix (sorta)
if !empty($CONEMUBUILD)
    set term=pcansi
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set bs=indent,eol,start
    " Dark scheme, only for terminal
    set background=dark " Does this stuff work?
    hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
"hi CursorLine term=bold cterm=bold
    highlight Cursor guifg=black
    highlight iCursor guifg=black
    colorscheme hybrid
endif

" Airline tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
let g:airline#extensions#tabline#buffer_idx_mode = 1	" display numbers in the tab line, and use mappings <leader>1 to <leader>9
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" startify
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 0		" automatically update sessions
let g:startify_show_sessions = 1
nnoremap <F1> :Startify<cr>

" pandoc
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby", "scala", "literatehaskell=lhaskell", "bash=sh","json=javascript","css","html","javascript","c","cpp"]
let g:pandoc#syntax#conceal#blacklist = ["list","atx"]

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers=['jscs']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
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

" Tagbar stuff
map <silent> <F3> :TagbarToggle<CR>

" Git
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gl :Glog<CR>

" Colorscheme

noremap <PageUp> :PrevColorScheme<CR>
noremap <PageDown> :NextColorScheme<CR>

  " Highlight TODO, FIXME, NOTE, etc.
autocmd ColorScheme * highlight TodoRed      guifg=#FF5F5F gui=bold
autocmd ColorScheme * highlight NoteOrange   guifg=LightGreen gui=bold

let g:delimitMate_expand_cr = 2

augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('TodoRed', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('NoteOrange', 'NOTE', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'INFO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'IDEA', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'BUG', -1)
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI/UX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set wildmenu " Wild menu expands autocompletion stuff in cmd mode for tab navigation
set wildignore=*.o,*~,*.pyc " Ignore compiled files

"Always show current position
set ruler

set cmdheight=1

" TODO: Configure backspace so it acts as it should act
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

set ignorecase " ignore case when searching
set smartcase  " case-sensitive if uppercase search


set hlsearch   " Highlight search results
set incsearch  " Show search matches as you type

"TODO:  For regular expressions turn magic on. what is magic?
" set magic


set showmatch   " Show matching brackets when text indicator is over them
set matchtime=2 " Time limit for matching brackets
set lazyredraw
set noshowmode  " don't show current mode
set nowrap      " don't wrap lines

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
nmap <leader>n :e ~/bling_vimrc<CR>

" Apply vimrc changes without restart
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Start in desired directory
cd W:/collector-api/

" Easy buffer navigation using tabs
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"Close buffer
nnoremap Q :bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab    " Use spaces instead of tabs
set smarttab     " insert tabs according toshiftwidth, not tabstop

" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'

set autoindent   " always set autoindenting on
set copyindent   " copy the previous indentation on autoindenting


 if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" jj mapped to Esc
inoremap jj <Esc>
inoremap kj <Esc>

" jk mapped to Esc
inoremap jk <Esc>

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
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" NOTE: These commands may have better places to go

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>

nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
