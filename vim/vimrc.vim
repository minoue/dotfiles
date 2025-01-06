if has("syntax")
    syntax on
endif

if &compatible
    set nocompatible
endif

call plug#begin()
Plug 'preservim/nerdtree', { 'On': 'NERDTreeToggle' }
Plug 'troydm/easybuffer.vim', { 'On': 'EasyBuffer' }
Plug 'majutsushi/tagbar', { 'On': 'tagbarToggle' }
Plug 'tomasr/molokai'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'yegappan/lsp'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
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
set clipboard=unnamed,autoselect
set wildmenu                    " use menu for command line completion
set modifiable                  " Changes to the text are possible
set shortmess+=I                " Disable startup message
set antialias                   " Enable antialias
set ambiwidth=single            " what to to with unicode chars of ambiguous with
set belloff=all
set shellslash


" #################################
" ######## KEY REMAPPINGS #########
" #################################

nnoremap <F1> :Startify<Enter>
nnoremap <F2> :NERDTreeToggle<Enter>
nnoremap <F3> :TagbarToggle<Enter>
nnoremap <F4> ggVG"+y
nnoremap <F7> :SendToMaya<Enter>
nnoremap <F10> :LspDiagShow<Enter>
" Copy current buffer to clipboard

" Command executions
" nnoremap <F5> :SendToMaya()<Enter>
" nnoremap <F7> :!clang++ -std=c++17 %:p -o %:r; %:p:h/%:r<Enter>

" Cursor move remapping
noremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy/Paste from/to clipboard
vnoremap Y "+y
nnoremap P "+p

" Buffer management
nnoremap <Space> :EasyBuffer<Enter>
command! BW :bn|:bd#                " Close current buffer
nnoremap sd :BW<Enter>
nnoremap <Tab> :bnext<Enter>        " Next Buffer
nnoremap <S-Tab> :bprevious<Enter>  " Previous Buffer
               
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Insert line below the cursor
noremap <CR> o<ESC>

" Replace selected texts
vnoremap <S-r> "hy:%s/<C-r>h//gc<left><left><left>

" Set ctrl-space for omni-completion
inoremap <C-Space> <C-x><C-o><C-p>

" File path completion
inoremap <C-f> <C-x><C-f><C-p>
inoremap <expr> /
      \ complete_info(['mode']).mode == 'files' && complete_info(['selected']).selected >= 0
      \   ? '<c-x><c-f>'
      \   : '/'

" Killing Q
nnoremap Q <Nop>

" Close buffer by q key
au FileType qf nnoremap <silent><buffer>q :quit<CR>

" terminal settings
tnoremap <ESC> <C-w><S-n>

augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" #####################################
" ############### LSP #################
" #####################################
let lspOpts = #{
            \ autoHighlightDiags: v:true,
            \ completionMatcher: 'icase',
            \ useBufferCompletion: v:true,
            \ useQuickfixForLocation: v:false,
            \}
autocmd User LspSetup call LspOptionsSet(lspOpts)

" python language server
let lspServers = [#{
	\    name: 'pylsp',
	\    filetype: ['python'],
	\    path: 'C:/Users/Michi/AppData/Roaming/Python/Python311/Scripts/pylsp.exe',
	\    args: []
	\ },
    \ #{
    \    name: 'clangd',  
	\    filetype: ['c', 'cpp'],
	\    path: 'C:/Program Files/LLVM/bin/clangd.exe',
	\    args: ['--background-index', '--header-insertion=never']
    \}
    \]
autocmd User LspSetup call LspAddServer(lspServers)

" call LspAddServer([#{
" 	\    name: 'clangd',
" 	\    filetype: ['c', 'cpp'],
" 	\    path: 'C:\\Program\ Files\\LLVM\\bin\\clangd.exe',
" 	\    args: ['--background-index']
" 	\  }])

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
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? "\ue0a2" : ''
endfunction

function! LightlineGitBranch()
    let bran = gitbranch#name()
    if bran != ''
        return bran
    else
        return ''
    endif
endfunction

let g:previm_disable_default_css = 1
let g:previm_custom_css_path = "C:\\Users\\Michi\\dotfiles\\markdown.css"

" #####################################
" ########## UTIL FUNCTIONS ###########
" #####################################

function! SetZBrushSyntax()
    let fullPath = expand('%:p')
    let ext = expand('%:e')
    let zscFile = substitute(fullPath, ext, "zsc", "g")

    if !empty(glob(zscFile))
        set filetype=zbrush
    endif
endfunction

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

function! SaveSessionProjectCmd() abort
    if has("win32")
        let git_dir = finddir('.git', expand('%:p:h'). ';')
        let proj_root = fnamemodify(git_dir, ':h')
        let proj_name = fnamemodify(proj_root, ':p:h:t')
        let session_dir = "~/vim/session"
        let session_path = session_dir . "/" . proj_name . ".vim"
    else
        let proj_root = finddir('.git/..', expand('%:p:h').';')
        let proj_name = split(proj_root, "/")[-1]
        let session_dir = '~/.local/share/nvim/sessions'
    endif
    let session_path = session_dir . "/" . proj_name . ".vim"
    exec 'silent mksession!' session_path
endfunction
command! SaveSessionProject call SaveSessionProjectCmd()

function! SendToMayaCommand() abort
    if has('macunix')
        let tmp_path = "/var/tmp/mayaScriptTmp.py"
    elseif has('unix')
        let tmp_path = "/usr/tmp/mayaScriptTmp.py"
    else
        " windows
        let tmp_path = $HOME . "\\AppData\\Local\\Temp\\mayaScriptTmp.py"
    endif

    " get buffer content
    let buff=getline(1, '$')

    " command string
    let cmd = "exec(open(R\"" . tmp_path . "\").read())"
    echo cmd

    call writefile(buff, tmp_path)

    let ch = ch_open("127.0.0.1:54321")
    call ch_sendraw(ch, cmd)
    call ch_close(ch)
endfunction
command! SendToMaya call SendToMayaCommand()

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


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

filetype plugin on
