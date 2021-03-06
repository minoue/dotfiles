if has("syntax")
  syntax on
endif

if &compatible
  set nocompatible
endif

set background=dark

" #####################################
" ########## PLUGIN INSTALL ###########
" #####################################
"

call plug#begin('~/.vim/plugged')
Plug 'skywind3000/asyncrun.vim', {'On': 'asyncrun'}
Plug 'troydm/easybuffer.vim', { 'On': 'EasyBuffer' }
Plug 'majutsushi/tagbar', { 'On': 'tagbarToggle' }
Plug 'lambdalisue/fern.vim'
Plug 'previm/previm'
Plug 'tyru/caw.vim'
Plug 'cohama/agit.vim'
" Plug 'dense-analysis/ale'
Plug 'minoue/mayaScriptEditor.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
Plug 'zah/nim.vim'
Plug 'tyru/open-browser.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'
Plug 'mattn/vim-lsp-settings'

" theme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

" #####################################
" ######### GENERAL SETTINGS ##########
" #####################################

" Display
set number                      " Show line numbers
set nowrap                      " No wrap
set textwidth=0                 " Disable auto return
set colorcolumn=100             " Line at column 80
set ruler                       " show cursor line and column in the status line
set nocursorline                " No highlight the screen line of the cursor
set title                       " let vim set the title of the window
set showcmd                     " show (partial) command in status line
set norelativenumber
set laststatus=2
set viminfo='20                 " Set maximum number of old file display

" Tab
set showtabline=2               " Always show tab line

" Search
set ignorecase                  " Case insensitive
set infercase
set incsearch                   " Incremental search
set hlsearch                    " Hightlight matched texts

" Edit
set virtualedit=all             " enable to move in empty spaces
set hidden                      " Hide buffer instead of closing (To keep Undo History)
set switchbuf=useopen           " use already opened buffer to open files
set showmatch                   " briefly show matching bracket if insert one
set matchtime=3                 " show matching bracket for 3 seconds
set matchpairs& matchpairs+=<:> " add '<' and '>' to matchpairs
set nowritebackup               " No backup file
set nobackup                    " No backup file
set noswapfile                  " No swap file
set backspace=indent,eol,start  " Delete everything by backspace

" Indent
set expandtab                   " use spaces when <tab> is inserted
set shiftwidth=4                " number of spaces to use for indent steps
set shiftround                  " round indent to multiple of shiftwidth
set tabstop=4                   " number of spaces that <tab> in file uses
set softtabstop=4               " number of spaces that <tab> uses while editting
set autoindent                  " take indent for new line from previous line
set smartindent                 " smart autoindenting for c programs

" File
set enc=utf-8                   " file
set encoding=utf-8              " encoding used internally
set fileencoding=utf-8          " file encoding for multi-byte text
set fileencodings=utf-8,cp932   " automatically detected characters encodings
scriptencoding utf-8

" Misc
set wildmenu                    " use menu for command line completion
set modifiable                  " Changes to the text are possible
set shortmess+=I                " Disable startup message
set ambiwidth=single            " what to to with unicode chars of ambiguous with

" #################################
" ######## KEY REMAPPINGS #########
" #################################

nnoremap <F1> :Startify<Enter>
nnoremap <F2> :Fern . -drawer -toggle<Enter>
nnoremap <F3> :TagbarToggle<Enter>
nnoremap <F4>  ggVG"+y
" Copy current buffer to clipboard
nnoremap <F5> :call MayaScriptEditorSendCmd()<Enter>

" Cursor move remapping
noremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy and paste
nnoremap Y "+y
nnoremap P "+gP

" Buffer management
nnoremap <Space> :EasyBuffer<Enter>
command! BW :bn|:bd#                " Close current buffer
nnoremap sd :BW<Enter>
nnoremap <Tab> :bnext<Enter>        " Next Buffer
nnoremap <S-Tab> :bprevious<Enter>  " Previous Buffer

" Command executions
nnoremap <C-\> :call QuickAsyncRun()<Enter>

" Insert line below the cursor
noremap <CR> o<ESC>

" Replace selected texts
vnoremap <S-r> "hy:%s/<C-r>h//gc<left><left><left>

" Set ctrl-space for omni-completion
inoremap <C-Space> <C-x><C-o><C-p>

" File path completion
inoremap <C-f> <C-x><C-f><C-p>

" Killing Q
nnoremap Q <Nop>

" Close buffer by q key
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" terminal settings
tnoremap <ESC> <C-w><S-n>

" Omni complete
set omnifunc=syntaxcomplete#Complete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" set completeopt=menuone     " Disable popup description


augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END


" #####################################
" ######### PLUGIN SETTINGS ###########
" #####################################

" LSP
let s:nimlspexecutable = "nimlsp"
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_diagnostics_enabled = 1
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" let g:asyncomplete_auto_popup = 0

if has('win32')
   let s:nimlspexecutable = "nimlsp.cmd"
   " Windows has no /tmp directory, but has $TEMP environment variable
   let g:lsp_log_file = expand('$TEMP/vim-lsp.log')
   let g:asyncomplete_log_file = expand('$TEMP/asyncomplete.log')
endif

if executable(s:nimlspexecutable)
   au User lsp_setup call lsp#register_server({
   \ 'name': 'nimlsp',
   \ 'cmd': {server_info->[s:nimlspexecutable]},
   \ 'whitelist': ['nim'],
   \ })
endif

" Lightline
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'LightlineGitBranch',
    \   'readonly': 'LightlineReadonly',
    \ },
    \ }


function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? '🔒' : ''
endfunction

function! LightlineGitBranch()
    let bran = gitbranch#name()
    if bran != ''
        return bran
    else
        return ''
    endif
endfunction

" Asyncrun
function! QuickAsyncRun() abort
    if &filetype == 'cpp'
        exec "AsyncRun! g++ -std=c++11 % -o %<; ./%<"
    elseif &filetype == 'python'
        exec "AsyncRun! python %"
    elseif &filetype == 'nim'
        exec "AsyncRun! nim c -r %"
    endif
endfunction

" Show AsyncRun output to quickfix
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile, BufRead *.{md, mdwn, mkd, mkdn, mark*} set filetype=markdown
augroup END


" #####################################
" ########## UTIL FUNCTIONS ###########
" #####################################

" Remove Trailing Whitespaces
function! RemoveTrailingWhiteSpaces()
    :%s/\s\+$/
endfunction
command! RemoveWhiteSpaces call RemoveTrailingWhiteSpaces()

" Copy file path to clipboard
function! CopyCurrentFilePath() abort
    let @+ = expand("%:p")
endfunction
command! CopyCurrentFilePath call CopyCurrentFilePath()

" Change current working directory
function! SetCurrentDirFunc() abort
    lcd %:p:h
endfunction
command! SetCurrentDir call SetCurrentDirFunc()

function! Clang_format() abort
    let p = expand("%:p")
    call system("clang-format -style=WebKit -i " . p)
    :edit
endfunction
command! ClangFormat call Clang_format()

function! MayaMake() abort
    exec "AsyncRun! cmake --build . --config Release --target install"
endfunction


" #####################################
" ######## LANGUAGE SETTINGS ##########
" #####################################

" JSON
let g:vim_json_syntax_conceal = 0
set conceallevel=0

" RST
set nofoldenable

" CSH
" Set csh syntax to cshrc
autocmd BufNewFile,BufRead * if expand('%:t') == 'cshrc' | set syntax=csh | endif

colorscheme vim-monokai-tasty

" #####################################
" ########    OS SETTINGS    ##########
" #####################################
"
" Load private settings
" 
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " Mac
        try
            source $HOME/dotfiles/vim/mac.vim
        catch
            echo "Failed to load env file"
        endtry
    else
        "Linux
        try
            source $HOME/linux.vim
        catch
            echo "Failed to load env file"
        endtry
    endif
elseif has("win32")
    " Windows
    try
        source $HOME/AppData/Local/nvim/win.vim
    catch
        echo "Failed to load env file"
    endtry
endif


filetype plugin on
