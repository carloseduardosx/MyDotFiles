set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    call dein#add(s:plugin_dir . '/Shougo/dein.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('w0rp/ale')
    call dein#add('nelstrom/vim-visual-star-search')
    call dein#add('mileszs/ack.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'css']})
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rhubarb')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('duff/vim-bufonly')
    call dein#add('gregsexton/MatchTag', {'on_ft': ['html']})
    call dein#add('sheerun/vim-polyglot')
    call dein#add('kristijanhusak/vim-hybrid-material')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neosnippet')
    call dein#add('zchee/deoplete-clang')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('zchee/deoplete-zsh')
    call dein#add('clojure-vim/async-clj-omni')
    call dein#add('slashmili/alchemist.vim')
    call dein#add('callmekohei/deoplete-fsharp')
    call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})
    call dein#add('honza/vim-snippets')
    call dein#add('dyng/ctrlsf.vim')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('junegunn/fzf', {'build': './install --bin'})
    call dein#add('junegunn/fzf.vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on                                                       "Enable plugins and indents by filetype

if dein#check_install()
  call dein#install()
endif

let g:mapleader = ","                                                           "Change leader to a comma
let g:maplocalleader = ","                                                      "Change local leader to a comma

let g:enable_bold_font = 1                                                      "Enable bold font in colorscheme

" ================ General Config ====================

set t_Co=256                                                                    "Set 256 colors
set t_AB=^[[48;5;%dm                                                            "Set 256 colors
set t_AF=^[[38;5;%dm                                                            "Set 256 colors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set encoding=utf8                                                               "Set utf-8 encoding
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new splits positions

syntax on                                                                       "turn on syntax highlighting

silent! colorscheme hybrid_material

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

" ================ Deoplete ==================
set previewheight=5

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================ Indentation ======================

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set nofoldenable

" ================ Auto commands ======================

augroup vimrc
    autocmd!
augroup END

autocmd vimrc BufWritePre * :call s:StripTrailingWhitespaces()                  "Auto-remove trailing spaces
autocmd vimrc InsertLeave * NeoSnippetClearMarkers                              "Remove unused markers for snippets
autocmd vimrc InsertEnter * :set nocul                                          "Remove cursorline highlight
autocmd vimrc InsertLeave * :set cul                                            "Add cursorline highlight in normal mode
autocmd vimrc FileType html,javascript,coffee,cucumber,sh,zsh,css setlocal sw=2 sts=2 ts=2 "Set 2 indent for html
autocmd vimrc FileType javascript,java :iabbrev <buffer> rr return
autocmd vimrc FileType javascript,java :iabbrev <buffer> return NOPENOPENOPE
autocmd vimrc FileType php,javascript setlocal cc=80                            "Set right margin only for php and js
autocmd vimrc VimEnter,BufNewFile,BufReadPost * call s:LoadLocalVimrc()         "Load per project vimrc (Used for custom test mappings, etc.)
autocmd StdinReadPre * let s:std_in=1                                           "Open NERDTree when vim is opened without any specified file
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif     "Open NERDTree when vim is opened without any specified file
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Close vim if NERDTree is the only window open
autocmd FileType html,css EmmetInstall                                          "Only Install emmet for html,css files

autocmd vimrc VimEnter * set vb t_vb=

autocmd vimrc FileType nerdtree syntax match hideBracketsInNerdTree
            \ "\]" contained conceal containedin=ALL

" ================ Completion =======================

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" ================ Airline ========================
set laststatus=2                                        "Show statusline all the time

" ================ Abbreviations ====================

iabbrev mail carloseduardosx2015@gmail.com
iabbrev gu https://github.com/carloseduardosx
inoreabbrev gmcall export function functionName({ server, client = getDefaultClient() }) {<CR>}
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
cnoreabbrev bda BufOnly
cnoreabbrev t tabe
cnoreabbrev T tabe

" ================ Functions ========================

function! s:StripTrailingWhitespaces()
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
endfunction

function! s:LoadLocalVimrc()
    if filereadable(glob(getcwd() . '/.vimrc.local'))
        :execute 'source '.fnameescape(glob(getcwd(). '/.vimrc.local'))
    endif
endfunction

function! Search()
    let term = input('Search for: ', '')
    if term != ''
        let path = input('Path: ', '', 'file')
        :execute 'Ack -Q "'.term.'" '.path
    endif
endfunction

" ================ Custom mappings ========================

" Git
nnoremap gst :Gstatus<CR>
nnoremap gdiff :Gdiff<CR>
nnoremap gb :Gbrowse<CR>
vnoremap gb :Gbrowse<CR>

" Disable cursor keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Update init.vim
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Move line down/up
nnoremap <Leader>[ ddp
nnoremap <Leader>] ddkP

" Wrap word with single/double quote
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>lel
vnoremap <Leader>` di""<Esc>Pl

" Remove search highlight
nnoremap <Leader>rh :noh<CR>

" Save and quit
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>wq :wq<CR>

" Disable arrow keys
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" Moving around
nnoremap H 0
nnoremap L $

" Comment map
nnoremap <Leader>c gcc

" Line comment command
xnoremap <Leader>c gc

" Map save to Ctrl + S
map <C-s> :w<CR>
imap <C-s> <C-o>:w<CR>

" Also save with ,w
nnoremap <Leader>w :w<CR>
nmap <Leader>k <Plug>(ale_previous_wrap)
nmap <Leader>j <Plug>(ale_next_wrap)

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Uppercase
nnoremap <c-u> viwU<esc>
inoremap <c-u> <esc>viwU<esc>i

" Open vertical split
nnoremap <Leader>v <C-w>v

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Indentation
nnoremap <Leader>i :setlocal sw=2 sts=2 ts=2<CR>

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <Leader>c "+y

" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <Leader>q :lclose<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Auto change directory to match current file
nnoremap <Leader>dc :cd %:p:h<CR>:pwd<CR>

" Filesearch plugin map for searching in whole folder
nnoremap <Leader>f :call Search()<CR>
nnoremap <Leader>af :CtrlSF

" Toggle buffer list
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPBufTag<CR>

" Search file
nnoremap <Leader>p :Ack<Space>
nnoremap <S-s> :Files<CR>
nnoremap <Leader>s :Files<Space>

" Search file in buffers
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>ls :ls<CR>:b<Space>

" Close current buffer
nnoremap <Leader>q :bd<CR>

" Maps for indentation in normal mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

" FZF
nnoremap gst :GFiles?<CR>
nnoremap <Leader>gc :Commits<CR>
nnoremap <Leader>bc :BCommits<CR>
nnoremap <Leader>lb :Buffers<CR>
nnoremap gls :GFiles<CR>
nnoremap <Leader>gls :GFiles<CR>
nnoremap <Leader>cc :Colors<CR>
nnoremap <Leader>ag :Ag<Space>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>ch :History:<CR>
nnoremap <Leader>chs :History/<CR>


" ================ plugins setups ========================

let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "luna"                                                    "Set theme to powerline default theme
let g:airline_skip_empty_sections = 1                                           "Removing empty sections
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 0                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

let g:gitgutter_realtime = 0                                                    "Disable gitgutter in realtime
let g:gitgutter_eager = 0                                                       "Disable gitgutter to eager load on tab or buffer switch

let g:user_emmet_expandabbr_key = '<c-e>'                                       "Change trigger emmet key
let g:user_emmet_next_key = '<c-n>'                                             "Change trigger jump to next for emmet
let g:user_emmet_install_global = 0                                             "Not load emmet for every file

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$', '\.vagrant', '\.idea']

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = [
            \ s:plugin_dir . '/honza/vim-snippets/snippets',
            \ '~/.config/nvim/snippets']

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#enable_smart_case = 1                                            "Enable deoplete smartcase autocompletion
let g:deoplete#max_list = 1000                                                  "Max autocompletion list
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.0/lib/libclang.dylib' " C/C++
let g:deoplete#sources#clang#clang_header = '/usr/bin/clang'                    " C/C++
let g:deoplete#keyword_patterns = {}                                            "Clojure
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'         "Clojure
let g:tern_request_timeout = 1                                                  "JS - Request timeout for tern server
let g:tern_show_signature_in_pum = '0'                                          "JS - This do disable full signature type on autocomplete
"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

let g:ackhighlight = 1                                                          "Highlight current search
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:delimitMate_expand_cr = 1                                                 "auto indent on enter

let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_lint_on_save = 1                                                      "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign

let g:goyo_width = 100                                                          "100 chars width
let g:goyo_height = 100                                                         "100% height

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '                                "Set up spacing for sidebar icons

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }                       "Set up ctrlp py matcher
let g:ctrlp_lazy_update = 350                                                   "Set delay to prevent extra search
let g:ctrlp_clear_cache_on_exit = 0                                             "Do not clear filenames cache, to improve CtrlP startup. You can manualy clear it by <F5>
let g:ctrlp_max_files = 0                                                       "Set no file limit, we are building a big project
if executable("ag")                                                             " If ag is available use it as filename list generator instead of 'find'
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" FZF
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
