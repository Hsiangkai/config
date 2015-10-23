set nocompatible              " be iMproved, required
filetype off                  " required

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
    endif

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    "Add your bundles here
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'chenkaie/smarthomekey.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'Rip-Rip/clang_complete'
    Plugin 'Shougo/neocomplcache.vim'
    Plugin 'michaeljsmith/vim-indent-object'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tomtom/tlib_vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'
    Plugin 'ervandew/supertab'
    Plugin 'vim-scripts/DirDiff.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'tmhedberg/matchit'
    Plugin 'Lokaltog/vim-powerline'
    Plugin 'chriskempson/tomorrow-theme'
    Plugin 'klen/python-mode'
    Plugin 'jeetsukumaran/vim-buffergator'
    Plugin 'xolox/vim-easytags'

    " plugin from http://vim-scripts.org/vim/scripts.html
    Plugin 'Syntastic'

    " Git plugin not hosted on GitHub
    Plugin 'git://repo.or.cz/vcscommand'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" general settings
set history=1000             " keep 1000 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
set expandtab                " use space instead of tab
set tabstop=4                " number of spaces for tab key
set shiftwidth=4             " number of spaces for each indent
set softtabstop=4            " number of spaces for tab key while performing editing operations
syntax on                    " enable syntax highlighting
colors Tomorrow-Night-Bright " vim color scheme
set autoread                 " auto read when file is changed from outside
set mouse=a                  " mouse support
if has("gui_running")        " GUI color and font settings
  set guifont=Monaco:h14
end
if has("gui_macvim")         " macvim shift movement
  let macvim_hig_shift_movement = 1
endif
set cursorline               " highlight current line
set clipboard=unnamed        " yank to the system register (*) by default
set showmatch                " cursor shows matching ) and }
set showmode                 " show current mode
set backspace=2              " make backspace work like most other apps
set laststatus=2             " always show statusline
set smartindent              " smart Indent
set cindent                  " C-style Indent
set smarttab                 " smart handling of the tab key
set shiftround               " round indent to multiple of shiftwidth
set ruler                    " show the cursor position all the time
set showcmd                  " display incomplete commands
set incsearch                " do incremental searching
set lazyredraw               " do not redraw while running macros (much faster) (LazyRedraw)
set t_Co=256                 " Use 256 colours
set hlsearch
set noswapfile
set ignorecase
set smartcase


" ',' is more convenient than '\'
let mapleader = ","
let g:mapleader = ","

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Backups and swapfile
set backup
set backupdir=$HOME/.vim/backup/
silent execute '!mkdir -p $HOME/.vim/backup'

" wildmode settings
set wildmenu
" in ESC: (command mode), disabled auto completion next part
set wildmode=list:longest
set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,.svn,.git

" Use Ctrl-hjkl to switch between window
nmap <C-j> <C-m>j
nmap <C-k> <C-m>k
nmap <C-h> <C-m>h
nmap <C-l> <C-m>l

" {{{ file encoding setting
set encoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set fileencoding=utf-8
set enc=utf-8
set tenc=utf8
set fenc=utf-8
" " }}}

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" disable sound on errors
set noeb vb t_vb=

" Hide toolbar and scrollbars in MacVim
set guioptions-=T
set guioptions-=L
set guioptions-=r

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" For ambiguous characters, ex: ”, and BBS XD
set ambiwidth=single

" " Favorite file types
set ffs=unix,dos,mac

" Remove 'recording' key mapping
nmap q <Cr>

" < and > are considering as a matching pair
set matchpairs+=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Diff related ]                                                           {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"force vim diff to ignore whitespace
set diffopt+=iwhite
" highlight diff color
hi diffchange ctermbg=236
hi diffadd ctermbg=4
hi DiffDelete ctermfg=69 ctermbg=234
hi difftext ctermbg=3 ctermfg=0

"DirDiff
let g:DirDiffExcludes = "*.git,*.svn,.*.swp,tags,cscope.*"
let g:DirDiffWindowSize = 6
let g:DirDiffAddArgs = "-w"

""""""""""""""""""""""""""""""
" Clang-Completion
""""""""""""""""""""""""""""""
let g:clang_complete_auto=1
let g:clang_auto_select = 1
let g:clang_use_library=1
let g:clang_library_path="/usr/lib"
let g:clang_snippets=0
let g:clang_conceal_snippets=0
let g:clang_periodic_quickfix=1
let g:clang_hl_errors=1
" let g:clang_snippets_engine='snipmate'
"let g:clang_complete_copen=1

""""""""""""""""""""""""""""""
" vim-snipmate
""""""""""""""""""""""""""""""
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-jquery'

""""""""""""""""""""""""""""""
" NERD tree
""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.o$', '\~$', '\.a$', '\.bak$', '\.d$']
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
nmap <leader>d :NERDTreeToggle<CR>
