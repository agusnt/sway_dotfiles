"------------------------------------------------------------------
" Syntax, number, limit, encoding, tab, fold, backspace, spell
"------------------------------------------------------------------

syntax on  " Highlight syntax
set ruler  " Show position of the cursor in status bar
let mapleader = "," " Change MapLeader

" Vertical line
set textwidth=80   " Maximum width of column
set colorcolumn=+1 " Change color

" Tab configuration, space instead of tab, 4-size
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

" Encode and spell
set encoding=utf-8
set spelllang=en

" Number relatives
set number relativenumber
set nu rnu

" Highlight cursor line
set cursorline     
set cursorcolumn

" Italic Comments
highlight Comment cterm=italic

" Show buffers like tabs
set hidden 
set showtabline=2  

" Incremental search
set incsearch

" Folding options
set foldmethod=syntax " Way to fold
set foldnestmax=2     " Maximum fold

" Set spell
set spell

"-------------------------------------------------------------------------------
" Movements
"-------------------------------------------------------------------------------

" >> Buffers <<
" Open a new buffer
nmap <leader>T :enew<cr> 
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

" -> Vim-Plug config stuff <-
" Install packer with:
" sh -c 'curl -fLo "~/.local/share}"/nvim/site/autoload/plug.vim --create-dirs\
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
call plug#begin('~/.local/share/nvim/plugged')
" >> Plugins to install <<
" Install plugins with :PlugInstall

" Spell Checker
Plug 'lewis6991/spellsitter.nvim'
" Cursor highlight
Plug 'yamatsum/nvim-cursorline'
" File Explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" Git blame
Plug 'f-person/git-blame.nvim'
" Gruvbox
Plug 'morhetz/gruvbox'
" Registers Peek
Plug 'gennaro-tedesco/nvim-peekup'
" Buffer as tab
Plug 'akinsho/nvim-bufferline.lua'
" Tag bar
Plug 'liuchengxu/vista.vim'
" Status line
Plug 'hoob3rt/lualine.nvim'
" ALE Lint engine
Plug 'dense-analysis/ale'
" Indent lines
Plug 'Yggdroot/indentLine'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Glow
Plug 'ellisonleao/glow.nvim'
call plug#end()

" --> Plugin configuration <--
" >> Spell Checker <<
lua require('spellsitter').setup()
" >> Status line <<
lua require('lualine').setup{options = {theme = 'gruvbox'}}
" >> Tag bar <<
nmap <leader>o :Vista<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" >> Buffer as tab <<
lua require("bufferline").setup{}
" >> Git blame on <<
let g:gitblame_enabled = 0
" >> Gruvbox <<
let g:gruvbox_italic=1
set background=dark
highlight Normal ctermbg=NONE
colorscheme gruvbox

" >> File Explorer << 
lua require('nvim-tree').setup {}
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


"-------------------------------------------------------------------------------
" Special options for specific stuff
"-------------------------------------------------------------------------------

" Python fold by indent instead of syntax
autocmd Filetype python set foldmethod=indent

" Makefile tabs 8-size instead of spaces 4-size
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

"-------------------------------------------------------------------------------
" Glow
"-------------------------------------------------------------------------------
let g:glow_border = "rounded"
