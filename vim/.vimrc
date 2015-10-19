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

" ',' is more convenient than '\'
let mapleader = ","
let g:mapleader = ","

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Backups and swapfile
set backup
set backupdir=$HOME/.vim/backup/
silent execute '!mkdir -p $HOME/.vim/backup'

syntax on
set noswapfile

set ignorecase
set smartcase

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

set hlsearch
set showmatch
set number

set autoindent     " Auto Indent
set smartindent    " Smart Indent
set cindent        " C-style Indent

set smarttab       " Smart handling of the tab key
set shiftround     " Round indent to multiple of shiftwidth
set shiftwidth=4   " Number of spaces for each indent
set tabstop=4      " Number of spaces for tab key
set softtabstop=4  " Number of spaces for tab key while performing editing operations
"set expandtab     " Use spaces for tabs.

set history=1000   " keep 1000 lines of command line history
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching

set lazyredraw     " Do not redraw while running macros (much faster) (LazyRedraw)

" {{{ file encoding setting
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set enc=utf-8
set tenc=utf8
set fenc=utf-8
" " }}}

" For ambiguous characters, ex: ”, and BBS XD
set ambiwidth=single

" " Favorite file types
set ffs=unix,dos,mac

"show CursorLine
set cursorline

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

" function! s:DiffWithSaved()
" 		let filetype=&ft
" 		diffthis
" 		vnew | r # | normal! 1Gdd
" 		diffthis
" 		exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
" endfunction
" com! DiffSaved call s:DiffWithSaved()
" nmap ,d :DiffSaved<CR>

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
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
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
