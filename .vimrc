
set nocompatible

" === Package Management ===
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Appearance
Plugin 'bling/vim-airline'

" File Management
Plugin 'scrooloose/nerdtree'            " File navigator sidebar
Plugin 'jistr/vim-nerdtree-tabs'        " NERDTree in all tabs
Plugin 'ctrlpvim/ctrlp.vim'             " Find files
Plugin 'vim-scripts/a.vim'              " Open alternates
Plugin 'airblade/vim-gitgutter'         " Show git diff symbols in gutter
"Plugin 'tpope/vim-fugitive'             " Use git commands without leaving vim

" Code Editing
Plugin 'scrooloose/syntastic'           " Check for syntax errors
Plugin 'valloric/youcompleteme'         " Autocomplete
Plugin 'ntpeters/vim-better-whitespace' " Strip trailing whitespace
Plugin 'godlygeek/tabular'              " Align CSV files and Markdown tables
Plugin 'HTML-AutoCloseTag'              " Insert closing HTML tags
Plugin 'Raimondi/delimitMate'           " Auto closing

" Tags
Plugin 'szw/vim-tags'                   " Generate tag files
Plugin 'majutsushi/tagbar'              " Display tags

" Syntax
Plugin 'sudar/vim-arduino-syntax'       " Arduino support
Plugin 'vim-jp/vim-cpp'                 " Improved C/C++ highlighting
Plugin 'JulesWang/css.vim'              " CSS Syntax
Plugin 'tpope/vim-git'                  " Better diff/commit highlighting
Plugin 'jez/vim-ispc'                   " Intel SPMD Program Compiler
Plugin 'pangloss/vim-javascript'        " Javascript
Plugin 'sheerun/vim-json'               " JSON, slightly different from js
Plugin 'LaTeX-Box-Team/LaTeX-Box'       " LaTeX
Plugin 'tpope/vim-liquid'               " Liquid templates
Plugin 'plasticboy/vim-markdown'        " Featureful .md support,
                                        "   must be after tabular
Plugin 'othree/nginx-contrib-vim'       " nginx configu files
Plugin 'mitsuhiko/vim-python-combined'  " Python 2 and 3 support
Plugin 'rust-lang/rust.vim'             " Rust
Plugin 'cakebaker/scss-syntax.vim'      " SCSS
Plugin 'keith/swift.vim'                " Swift!
Plugin 'tmux-plugins/vim-tmux'          " Syntax highlighting for tmux config

" Misc
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-superman'
Plugin 'ConradIrwin/vim-bracketed-paste' " Automatically detect pasting
Plugin 'tpope/vim-dispatch'              " Asynchronous commands

call vundle#end()
filetype plugin indent on

" === General ===
set backspace=indent,eol,start " 'stronger' backspace
set encoding=utf-8  " Encode files in UTF-8
set laststatus=2    " Always show file status
set nobackup        " Fewer annoying files
set noswapfile      " Fewer annoying files
set nowritebackup   " Fewer annoying files
set scrolloff=3     " Keeps a few lines between cursor and edge
set sidescrolloff=5 " Keeps a few columnns between cursor and edge
set showcmd         " Show multicharacter commands as they are being typed
set ttyfast         " idk but bezi claims smoother performance

" === Search ===
set hlsearch        " Highlight all search terms
set incsearch       " Apply search incrementally
set showmatch       " Shows current search result
set noignorecase    " Case sensitive as default
set smartcase       " Adaptive case sensitivity (only if ignorecase is on)

" === File completion ===
set splitright      " vsplit to the right
set fileignorecase  " Ignores case in file completion
set wildmenu        " Show potential matches above completion,
set wildmode=full   " completing the first immediately

" Force write readonly files using sudo
command! WS w !sudo tee %
" Exit insert mode with kj which is faster than escape
inoremap kj <ESC>
" Allow mouse interaction
if has('mouse')
    set mouse=a
endif

" === Appearance ===
syntax on           " Syntax highlighting
set number          " Line numbers
set ruler           " Cursor position in file
" set background=dark " Always keep a dark background
" set cursorline      " Highlights/underlines current editor line
" set cursorcolumn    " Highlights/underlines current editor column
set cc=81           " Puts barrier line at 80 columns
" TODO: Pick a universal color scheme

" === Formatting ===
set wrap
set textwidth=79
set formatoptions=qrn1

" === Whitespace ===
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" === Keybindings ===
" Set leader to Space, with comma as a fallback and as something to display
let mapleader = ","
let g:mapleader = ","
map <space> <leader>
" Scroll-like navigation
noremap <silent> J <C-d>
noremap <silent> K <C-u>
" Case-insensitive search
nnoremap ? /\c

" === Commands/Aliases ===
" clear hilighting from search
nmap <leader><space> :noh<cr>
" Toggle the sidebar for the plugin NERDTree
nmap <silent> <leader>t :NERDTreeToggle<cr>
" Toggle the sidebar for the plugin tagbar
nmap <silent> <leader>b :TagbarToggle<cr>
" Toggle files with A.vim
nmap <silent> <leader>a :A<cr>
" Trim whitespace and save
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> :w<CR>
nnoremap <silent> <leader>q :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> :wq<CR>
" Switch tabs with L and H like my Vimium configuration
set switchbuf=usetab
nnoremap <silent> L :tabn<cr>
nnoremap <silent> H :tabp<cr>
" Search and replace the word under the cursor
nnoremap <leader>/ *
" Format the current paragraph (most useful in markdown)
nnoremap <leader>f {)gq}
" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_
" Split and join lines
nnoremap <leader>J :join<cr>
nnoremap <leader>j i<cr><esc>k$
" Center search result on screen
nmap n nzz
nmap N Nzz
" Jump to the end of the line when pasting
nnoremap P p$

" === Plugin Settings ===

" Built-in vim plugins
let g:netrw_liststyle=3      " When viewing directories, show nested tree mode
let g:netrw_dirhistmax = 0   " Don't create .netrwhist files

" Airline
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Nerdtree
let g:nerdtree_tabs_open_on_console_startup=0

" Syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  " Turn off syntastic for tex files
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" Auto-complete (YCM)
set noinfercase       " Does NOT change the case of letters already typed

" vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
let g:vim_markdown_new_list_item_indent=2
let g:vim_markdown_toc_autofit=1

" === Tags ===
let g:vim_tags_auto_generate=1

" Reconfigure the tagbar for latex
let g:tagbar_type_tex = {
\    'ctagstype' : 'tex',
\    'kinds' : [
\        's:sections',
\        'g:graphics:0:0',
\        'l:labels',
\        'r:refs:1:0',
\        'p:pagerefs:1:0'
\    ],
\    'sort' : 0,
\ }

" git gutter
hi clear SignColumn
" Only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Better Whitespace
" Don't highlight whitespace in git commit messages (for diffs)...
let g:better_whitespace_filetypes_blacklist=['gitcommit']
" ... but strip it on save so that we're still safe
autocmd FileType gitcommit autocmd BufWritePre <buffer> StripWhitespace

" Tabularize
:abbrev Table Tabularize

" delimitMate - Autocloseable tags
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Command Summary
" \t = View File Tree
" \b = View Outline
" ctrl+p -> fuzzyfind -> ctrl+t = fuzzy find new tab
" :AV = Open Counterpart/Alternative
" :Tab /<exp> = align on <exp>

" === File Types ===
augroup myFiletypes
  au!

  " Markdown files
  au BufRead,BufNewFile *.md setlocal filetype=markdown
  " Treat all .tex files as latex
  au BufRead,BufNewFile *.tex setlocal filetype=tex
  " LaTeX class files
  au BufRead,BufNewFile *.cls setlocal filetype=tex
  " Gradle files
  au BufRead,BufNewFile *.gradle setlocal filetype=groovy
  " gitconfig files
  au BufRead,BufNewFile gitconfig setlocal filetype=gitconfig

  " Turn on spell checking and 80-char lines by default for these filetypes
  au FileType pandoc,markdown,tex setlocal spell
  au FileType pandoc,markdown,tex setlocal tw=80

  " Always use tabs
  au FileType gitconfig setlocal noexpandtab
  au FileType go setlocal noexpandtab

augroup END

" === Optional (Plugin) ===
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

