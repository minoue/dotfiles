if has("syntax")
  syntax on
endif

if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/nvim/highlight

" #####################################
" ########## PLUGIN INSTALL ###########
" #####################################


call plug#begin('~/.vim/plugged')
Plug 'troydm/easybuffer.vim', { 'On': 'EasyBuffer' }
Plug 'majutsushi/tagbar', { 'On': 'tagbarToggle' }
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'patstockwell/vim-monokai-tasty'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim' " Required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'JoseConseco/telescope_sessions_picker.nvim'
Plug 'folke/tokyonight.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'regen100/cmake-language-server'

call plug#end()

" #####################################
" ######### GENERAL SETTINGS ##########
" #####################################

" Display
set number                      " Show line numbers
set nowrap                      " No wrap
set textwidth=0                 " Disable auto return
set colorcolumn=80              " Line at column 80
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

nnoremap <F1> :NvimTreeToggle<Enter>
nnoremap <F3> :TagbarToggle<Enter>
nnoremap <F4> ggVG"+y
" Copy current buffer to clipboard

" Command executions
nnoremap <F5> :SendToMaya()<Enter>
nnoremap <F7> :!clang++ -std=c++17 %:p -o %:r; %:p:h/%:r<Enter>
nnoremap <F9> :SaveSessionProject<Enter>
nnoremap <F10> :Telescope sessions_picker<Enter>


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

augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>


" #####################################
" ######### PLUGIN SETTINGS ###########
" #####################################

" set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup {

    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'path' },
    }
  }

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  require('lspconfig').clangd.setup {
    capabilities = capabilities
  }

  require('lspconfig').pylsp.setup {
    capabilities = capabilities
  }

  require('lspconfig').haxe_language_server.setup {
    capabilities = capabilities
  }

  require('lspconfig').cmake.setup {
    capabilities = capabilities
  }

  require'lspconfig'.lua_ls.setup{
    capabilities = capabilities
  }
EOF

lua <<EOF
    local telescope = require("telescope")
    telescope.setup {
        defaults = {
            file_ignore_patterns = { 'build', '.git' }
        },
        pickers = {
            find_files = {
                hidden = true
            }
        },
    }
    require('telescope').load_extension('sessions_picker')
EOF

lua <<EOF
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup()

    -- OR setup with some options
    require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    })
EOF

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "python", "cpp" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "vue", "ruby" },  -- list of language that will be disabled
  },
}
EOF

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

" Asyncrun
function! QuickAsyncRun() abort
    if &filetype == 'cpp'
        exec "!g++ -std=c++11 -o %< %; ./%<"
    elseif &filetype == 'python'
        exec "!python3 %"
    elseif &filetype == 'nim'
        exec "!nim c -r %"
    endif
endfunction

function! SetZBrushSyntax()
    let fullPath = expand('%:p')
    let ext = expand('%:e')
    let zscFile = substitute(fullPath, ext, "zsc", "g")

    if !empty(glob(zscFile))
        set filetype=zbrush
    endif
endfunction

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

    let ch = sockconnect("tcp", "127.0.0.1:54321")
    call chansend(ch, cmd)
    call chanclose(ch)
endfunction
command! SendToMaya call SendToMayaCommand()

function! CMAKE_RUN(action) abort
    let current_dir = getcwd()
    let proj_root = finddir('.git/..', expand('%:p:h').';')
    let build_dir = proj_root . "/build"
    exec "lcd " . build_dir

    if a:action == "make"
        let cmd = "!cmake " . proj_root
    elseif a:action == "build"
        let cmd = "!cmake --build " . build_dir . " --config Release"
    elseif a:action == "clean"
        let cleancmd = "!cmake --build " . build_dir . " --target clean"
        exec cleancmd
        let cmd = "!rm -rf Makefile CMakeCache.txt cmake_install.cmake CMakeFiles"
    else 
        echo "Undefined action"
        return
    endif
    exec cmd
    exec "lcd " . current_dir
endfunction
command! CMakeMake call CMAKE_RUN("make")
command! CMakeBuild call CMAKE_RUN("build")
command! CMakeClean call CMAKE_RUN("clean")

function! SaveSessionProjectCmd() abort
    if has("win32")
        let git_dir = finddir('.git', expand('%:p:h'). ';')
        let proj_root = fnamemodify(git_dir, ':h')
        let proj_name = fnamemodify(proj_root, ':p:h:t')
        let session_dir = "~/AppData/Local/nvim-data/session"
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

" Show AsyncRun output to quickfix
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile, BufRead *.{md, mdwn, mkd, mkdn, mark*} set filetype=markdown
    autocmd BufEnter *.txt call SetZBrushSyntax()
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
            source $HOME/dotfiles/nvim/mac.vim
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

autocmd BufRead,BufNewFile *.zs set filetype=zbrush
colorscheme tokyonight-night

filetype plugin on
