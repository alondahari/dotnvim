" --------------------------------------------
" Configuration around Project rc files
" --------------------------------------------

" enable project specific .vimrc files
set exrc

" --------------------------------------------
" Configuration around Tabs, Indentation, Etc.
" --------------------------------------------

" Explicitly tell vim to NOT replace tab characters with space characters. If
" we wanted to instead have space characters inserted instead of tab
" characters we would use set expandtab.
set noexpandtab

" The number of character spaces to visually represent a tab as. Note: This
" does NOT insert space characters in place of tab characters. It simply
" changes how tab characters visually appear.
set tabstop=2

" The number of character spaces the indention system should shift in or out.
" The indention system will try and use all tab characters if noexpandtab is
" set. If it can't it will use a combination of tab characters and space
" characters to reach the correct shift. Ex: lets say you have set noexpandtab
" shiftwidth=6 tabstop=4. shiftwidth isn't evenly divisible by 4 so it would
" use a tab character followed by 2 space characters. However, if you have set
" noexpandtab shiftwidth=6 tabstop=2 it would use 3 tab characters.
set shiftwidth=2

" Number of spaces that a <Tab> counts for while performing editing
"	operations, like inserting a <Tab> or using <BS>.
set softtabstop=0

" Always insert blanks according to the 'tabstop' or 'softtabstop'.
" 'shiftwidth' is only used for shifting text left or right.
set nosmarttab

au FileType markdown setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0 nosmarttab
au FileType tf setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0 smarttab
au FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0 smarttab
au FileType htmldjango setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0 smarttab
au FileType html setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=0 smarttab

" ----------------------------------------------
" Line Numbering
" ----------------------------------------------
" Absolute line Numbering
" set number

" Relative Line Numbering
" set relativenumber

" Hybrid - Relative except for line currently on which shows absolute number
set number
set relativenumber

" Min number of characters to use for line number column
set numberwidth=5

" ----------------------------------------------
" Leader Key
" ----------------------------------------------
let mapleader = ","

" ----------------------------------------------
" NetRW - File Browser Mode
" ----------------------------------------------
" choose the tree view
" let g:netrw_liststyle = 0
" hide the default banner
" let g:netrw_banner = 0

" ----------------------------------------------
" Misc Preferences
" ----------------------------------------------

" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

" disable auto folding when opening a buffer
" set nofoldenable

" show matching bracket when in insert mode
set showmatch

" keep abandoned unsaved buffers open in background
set hidden

" disable wrapping of text, just move editor over when cursor moves over
set nowrap

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Search
set nohlsearch
set incsearch
set ignorecase

" make it so when the cursor is within 8 lines of the edge of the screen it
" causes the scroll
set scrolloff=8


set signcolumn=yes

set colorcolumn=80

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" --------------------------------------------
" Plugins
" --------------------------------------------

" :PlugInstall - install
" :PlugUpdate - update or install
" :PlugStatus - status of plugins

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" Fuzzy Finder (& interactive global search w/ ripgrep via :Rg)
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'

" Airline Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Schemes
Plug 'drewtempelmeyer/palenight.vim'

" Git Integration
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Utilities
Plug 'tpope/vim-commentary' " make commenting code easier
Plug 'tpope/vim-surround' " make dealing with surroundings easier

" Global Search
" Normally I would also include the following. But skim provides interactive
" ripgrep support so I don't need the following plugin
" Plug 'jremmen/vim-ripgrep'

" Various Language Support

" Markdown
Plug 'plasticboy/vim-markdown' " support Markdown syntax

" Slack
Plug 'uptech/vim-slack-format'

" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Plug 'HerringtonDarkholme/yats.vim' " TypeScript syntax REQUIRED for nvim-typescript
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/denite.nvim'

" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'

" Initialize plugin system
call plug#end()

" --------------------------------------------
" Color scheme
" --------------------------------------------
set background=dark
colorscheme palenight

" --------------------------------------------
" Airline Theme
" --------------------------------------------
let g:airline_theme='deus'

" ----------------------------------------------
" Fuzzy Finder Configuration
" ----------------------------------------------
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>

" ----------------------------------------------
" Alternate File Switching
" ----------------------------------------------
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<CR>:call AltCommand(expand('%'), ':e')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

nnoremap <leader>n :call RenameFile()<cr>

" ----------------------------------------------
" Markdown Support
" ----------------------------------------------

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation isn't good
let g:vim_markdown_conceal = 0

" support front matter of various formats
let g:vim_markdown_frontmatter = 1 " for YAML format
let g:vim_markdown_toml_frontmatter = 1 " for TOML format
let g:vim_markdown_json_frontmatter = 1 " for JSON format

" Open current buffer in Marked 2 for previewing
nnoremap <leader>m2 :!open -a 'Marked 2' "%"<CR>

" ----------------------------------------------
" AutoCompletion
" ----------------------------------------------

" let g:deoplete#enable_at_startup = 1

" ----------------------------------------------
" TypeScript Support
" ----------------------------------------------

" mapping for get type of what cursor is on
" nmap <leader>gt :TSType<CR>

" mapping for get definition of what cursor is on in a preview
" nmap <leader>gd :TSDefPreview<CR>

" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
