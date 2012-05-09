 " ==========================================================
 " Shortcuts
 " ==========================================================
 set nocompatible              " Don't be compatible with vi
 set encoding=utf8

 " Open NerdTree
 let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
 let NERDTreeDirArrows=0

 " ==========================================================
 " Basic Settings
 " ==========================================================
 syntax on                     " syntax highlighing
 filetype on                   " try to detect filetypes
 filetype plugin indent on     " enable loading indent file for filetype
 set number                    " Display line numbers
 set numberwidth=1             " using only 1 column (and 1 space) while possible
 set background=dark           " We are using dark background in vim
 set title                     " show title in console title bar
 set wildmenu                  " Menu completion in command mode on <Tab>
 set wildmode=full             " <Tab> cycles between all matching choices.
 set ttyfast
 " don't bell or blink
 set noerrorbells
 set vb t_vb=

 " Ignore these files when completing
 set wildignore+=*.o,*.obj,.git,*.c
 set grepprg=ack-grep          " replace the default grep program with ack

" show a line at column 79
if exists("&colorcolumn")
    set colorcolumn=79
endif

 """ Moving Around/Editing
 set cursorline              " have a line indicate the cursor location
 set ruler                   " show the cursor position all the time
 set nostartofline           " Avoid moving cursor to BOL when jumping around
 set virtualedit=block       " Let cursor move past the last char in <C-v> mode
 set scrolloff=3             " Keep 3 context lines above and below the cursor
 set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
 set showmatch               " Briefly jump to a paren once it's balanced
 set nowrap                  " don't wrap text
 set linebreak               " don't wrap textin the middle of a word
 set autoindent              " always set autoindenting on
 set smartindent             " use smart indent if there is no indent file
 set tabstop=4               " <tab> inserts 4 spaces 
 set shiftwidth=4            " but an indent level is 2 spaces wide.
 set softtabstop=4           " <BS> over an autoindent deletes both spaces.
 set expandtab               " Use spaces, not tabs, for autoindent/tab key.
 set shiftround              " rounds indent to a multiple of shiftwidth
 set matchpairs+=<:>         " show matching <> (html mainly) as well
 set foldmethod=indent       " allow us to fold on indents
 set foldlevel=99            " don't fold by default

 """" Reading/Writing
 set noautowrite             " Never write a file unless I request it.
 set noautowriteall          " NEVER.
 set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

 """" Messages, Info, Status
 set ls=2                    " allways show status line
 set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
 set confirm                 " Y-N-C prompt if closing with unsaved changes.
 set showcmd                 " Show incomplete normal mode commands as I type.
 set report=0                " : commands always print changed line count.
 set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
 set ruler                   " Show some info, even without statuslines.
 set laststatus=2            " Always show statusline, even if only 1 window.

 hi User1 ctermfg=red ctermbg=grey cterm=NONE
 hi User2 ctermfg=green ctermbg=grey cterm=NONE
 hi User3 ctermfg=yellow ctermbg=grey cterm=NONE
 hi User4 ctermfg=blue ctermbg=grey cterm=NONE
 hi User5 ctermfg=magenta ctermbg=grey cterm=NONE
 hi User6 ctermfg=cyan ctermbg=grey cterm=NONE
 hi User7 ctermfg=white ctermbg=grey cterm=NONE

 set statusline=
 set statusline +=%1*\ %n\ %*            "buffer number
 set statusline +=%4*%{&ff}%*            "file format
 set statusline +=%4*%y%*                "file type
 set statusline +=%2*\ %<%F%*            "full path
 set statusline +=%2*%m%*                "modified flag
 set statusline +=%4*%=%5l%*             "current line
 set statusline +=%1*/%L%*               "total lines
 set statusline +=%5*%4v\ %*             "virtual column number
 set statusline +=%6*0x%04B\ %*          "character under cursor

 """ Searching and Patterns
 set ignorecase              " Default to using case insensitive searches,
 set smartcase               " unless uppercase letters are used in the regex.
 set smarttab                " Handle tabs more intelligently 
 set hlsearch                " Highlight searches by default.
 set incsearch               " Incrementally search while typing a /regex


 " Python
 "au BufRead *.py compiler nose
 au FileType python set omnifunc=pythoncomplete#Complete
 au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
 " au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
 " Don't let pyflakes use the quickfix window
 let g:pyflakes_use_quickfix = 0

 autocmd VimEnter * NERDTree
 autocmd VimEnter * wincmd p

 if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
 endif

 " This beauty remembers where you were the last time you edited the file, and returns to the same position.
 au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
