" ====================================
" Last Change: 2020-12-8 [18:03:00]
"      Author: Z3R07-RED
" ====================================
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
"

set nocompatible              " be iMproved, required
syntax on                     " required
set nowrap
set encoding=utf8
filetype off                  " required

"""" START Vundle Configuration
" Disable filetypefor vundle
" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" (*) Aqui agregamos las líneas <Plugin> para incorporar nuevos plugins a Vim

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
"Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'itchyny/vim-cursorword'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
"Plugin 'townk/vim-autoclose'
Plugin 'raimondi/delimitmate'
Plugin 'Yggdroot/indentLine'
Plugin 'xuyuanp/nerdtree-git-plugin'


" Theme / Interface
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'ryanoasis/vim-devicons'

" Theme / Interface
Plugin 'connorholyday/vim-snazzy'
Plugin 'ajh17/Spacegray.vim'
Plugin 'colepeters/spacemacs-theme.vim'

" Git Support
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"  -----------------------
" | Configuration Section |
"  -----------------------

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Muy Importantes
set autoindent
set history=1000
set mouse+=a
set confirm
"set paste
set nobackup
set incsearch
set hlsearch
set ignorecase
set smartcase
"set showmatch    " está ahí para resaltar las llaves coincidentes
set foldmethod=manual
nnoremap <space> za
set cursorline
set cursorcolumn
"highlight CursorLine ctermfg=Black ctermbg=Gray guifg=Black guibg=Gray
"highlight CursorColumn ctermfg=Black ctermbg=Gray guifg=Black guibg=Gray


set title
set titleold="Terminal"
set titlestring=%F


noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

set splitbelow
set splitright
" Theme and Styling
set t_Co=256
set background=dark
set termguicolors
colorscheme spacegray     " snazzy o tir_black o spacegray o turbocpp

" SNAZZY THEME TRANSPARENT ...
"let g:SnazzyTransparent = 1


" Save folds
autocmd! BufWinLeave,BufWritePost,BufLeave,WinLeave ?* if !empty(glob(expand('%:p'))) | mkview | endif
autocmd! BufWinEnter ?* if !empty(glob(expand('%:p'))) | silent loadview | endif

" NERDTREE
map <F2> :NERDTreeToggle <CR>
"let g:nerdtree_tabs_open_on_console_startup=1
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'white', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" Solo si tiene powerline instalado y powerline-fonts o (fonts-powerline)
"let g:NERDTreeDirArrowExpandable = '▸ '
"let g:NERDTreeDirArrowCollapsible = '▾ '

highlight clear SignColumn

" AIRLINE
"let g:airline_powerline_fonts = 1     " Solo si tiene powerline instalado y powerline-fonts o (fonts-powerline)
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='atomic'        " o 'cool' o 'hybridline' o 'simple' o 'atomic'

" mover a la división de abajo
nnoremap <C-J> <C-W><C-J>
" mover a la división de arriba
nnoremap <C-K> <C-W><C-K>
" mover a la división a la derecha
nnoremap <C-L> <C-W><C-L>
" mover a la división a la izquierda
nnoremap <C-H> <C-W><C-H>
" buffers derecha
map <C-B> :bnext <CR>
" buffers izquierda
map <C-G> :bprevious <CR>
"Nueva ventana derecha
map <F7> :vsplit <CR>
"Nueva ventana abajo
map <F8> :split <CR>

" TAGBAR
let g:tagbar_width=20           "default 40
let g:tagbar_compact=1          "default 0
let g:tagbar_foldlevel=2        "default 99
map <F9> :TagbarToggle <CR>
map <C-F9> :!/

" delimitmate & vim-autoclose
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1
"let g:better_whitespace_ctermcolor= 'green'
let g:strip_max_file_size=50
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

" FLAKE8
" pip install flake8
autocmd FileType python map <buffer> <F4> :call flake8#Flake8()<CR>
let g:flake8_quickfix_location="topleft"

" syntastic
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Plugin vim-gitgutter
let g:gitgutter_max_signs = 500
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
let g:gitgutter_show_msg_on_hunk_jumping = 0
set foldtext=gitgutter#fold#foldtext()
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = 'ww'

" TMUX
"let g:tmuxline_powerline_separators=0
"let g:airline#extensions#tmuxline#enabled=0
"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '|',
"    \ 'right' : '',
"    \ 'right_alt' : '|',
"    \ 'space' : ' '}

" Plugin indentLine
let g:indentLine_defaultGroup = 'SpecialKey'
" let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
