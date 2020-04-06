" Line number vs relative number
set relativenumber
"set number

"Highlight the current line
set cursorline
set ruler "Show the cursor position all the time

"Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

"Setting text width (0 = disable), after the nr of chars newline char is inserted automatically.
set textwidth=0

"Automatically indent new lines
set autoindent

"Save undo history to file to enable undo even after save
set undofile
set undodir=/tmp

"Wildmenu
set wildoptions=pum
"Sets kind of a transparency thing, but might look weird, commented out for now.
"set pumblend=80

"Disables timeout for leader key for example
set notimeout
"Vim keybinds:
"####################################################################################################
" Setting leader key to <Space>
let mapleader = " "

"Better vertical movement for wrapped lines
nnoremap j gj
nnoremap k gk

"Pop-up menu C-j, C-k navigation
"For NCM2
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"For wildmenu
cnoremap <expr> <C-j> wildmenumode() ? "\<C-n>" : "\<C-j>"
cnoremap <expr> <C-k> wildmenumode() ? "\<C-p>" : "\<C-k>"

"Terminal mapping esc to enter normal mode
tnoremap <Esc> <C-\><C-n>

"Plugins
" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
"####################################################################################################
"####################################################################################################
"syntax hint: Plug 'github_username/repo_name'
    "####################################################################################################
    " NERDCommenter - comment/uncomment lines easily
    Plug 'preservim/nerdcommenter'
    "####################################################################################################
    " NERDTree to show a tree view of the directory on the left hand side
    Plug 'preservim/nerdtree'
    "####################################################################################################
    " Vim Tmux Navigator
    " Helps interaction between vim splits and tmux panes
    " https://github.com/christoomey/vim-tmux-navigator has settings for .tmux.conf to work together
    Plug 'christoomey/vim-tmux-navigator'
    "####################################################################################################
    " Airline - status bar plugin
    Plug 'bling/vim-airline'
    "####################################################################################################
    " Color scheme
    Plug 'tomasr/molokai'
    "####################################################################################################
    " Auto close parens, braces, brackets, etc
    Plug 'jiangmiao/auto-pairs'
    "####################################################################################################
    "Highlights trailing white-space
    Plug 'ntpeters/vim-better-whitespace'
    "####################################################################################################
    "Easier resizing splits
    Plug 'simeji/winresizer'
    "####################################################################################################
    "Language server protocol plugin
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    "####################################################################################################
    "Code completion - NCM2
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-vim-lsp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    "####################################################################################################
    "Avy-like jump-to-char
    Plug 'easymotion/vim-easymotion'
    "####################################################################################################
    " to update &runtimepath and initialize plugin system:
    " Automatically executes filetype plugin indent on and syntax enable. You can
    " revert the settings after the call. e.g. filetype indent off, syntax off,
    " etc.
call plug#end()
" Settings for specific plugins:


"####################################################################################################
"NERDTree - 'preservim/nerdtree'
"====================================================================================================
" - toggle keybind:
nnoremap <leader>n :NERDTreeToggle<cr>
"====================================================================================================


"####################################################################################################
"Colorscheme - 'tomasr/molokai'
"====================================================================================================
let g:molokai_original=1
colorscheme molokai
"====================================================================================================


"####################################################################################################
"Auto close parens, braces, brackets, etc - 'jiangmiao/auto-pairs'
"====================================================================================================
"When you press the key for the closing pair (e.g. `)`) it jumps past it.
"If set to 1, then it'll jump to the next line, if there is only whitespace.
"If set to 0, then it'll only jump to a closing pair on the same line:
let g:AutoPairsMultilineClose=0
"Map <space> to insert a space after the opening character and before the
"closing one.
"execute 'inoremap <buffer> <silent> <CR> <C-R>=AutoPairsSpace()<CR>'
let g:AutoPairsMapSpace=0
"====================================================================================================


"####################################################################################################
"NERDCommenter - 'preservim/nerdcommenter'
"====================================================================================================
"For default keybinds -> :help nerdcommenter
"Defaults are:
"<leader>cc - comment out
"<leader>cu - uncomment
"====================================================================================================


"####################################################################################################
"Better whitespace - 'ntpeters/vim-better-whitespace'
"====================================================================================================
nnoremap <leader>w :StripWhitespace<cr>
"====================================================================================================


"####################################################################################################
"Resizing splits - simeji/winresizer
"====================================================================================================
"Default binding to enter split resize mode is <C-E>
"====================================================================================================


"####################################################################################################
"Language server protocol - vim-lsp
"====================================================================================================
"Registering ccls as a backend
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['h',  'hpp', 'c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
nnoremap <leader>def :LspDefinition<cr>
nnoremap <leader>pdef :LspPeekDefinition<cr>
nnoremap <leader>dec :LspDeclaration<cr>
nnoremap <leader>pdec :LspPeekDeclaration<cr>
nnoremap <leader>imp :LspImplementation<cr>
nnoremap <leader>hov :LspHover<cr>
nnoremap <leader>refs :LspReferences<cr>

"====================================================================================================


"####################################################################################################
"NCM2 - Autocomplete
"====================================================================================================
"Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
"====================================================================================================
