"-------------------------------------------------------------------------------
" install vim-plug automatically
"-------------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"------------------------------------------------------------------------------- 
" plugin list
"------------------------------------------------------------------------------- 

" specify a directory for plugins
call plug#begin('~/.vim/plugged')

" NERDTree 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" NERDTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" NERD comment plugin
Plug 'scrooloose/nerdcommenter'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" airline status bar
Plug 'vim-airline/vim-airline'

" surround
Plug 'tpope/vim-surround'

" Auto add pairs
Plug 'jiangmiao/auto-pairs'

" Rainbow Improved
Plug 'luochen1990/rainbow'

" ultisnips
Plug 'SirVer/ultisnips'

" snippets
Plug 'honza/vim-snippets'

" LaTex plugin
" Plug 'lervag/vimtex'

" Easy align
Plug 'junegunn/vim-easy-align'

" echo doc
Plug 'Shougo/echodoc.vim'

" fmt plugin
Plug 'Chiel92/vim-autoformat'

" gruvbox
Plug 'morhetz/gruvbox'

" init plugin system
call plug#end()

"-------------------------------------------------------------------------------
" NERDTree Setting
"-------------------------------------------------------------------------------

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change default arrows
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

" Change NERDTree window size
let g:NERDTreeWinSize = 30

" NERDTree toggle shortcur
noremap <F2> :NERDTreeToggle<CR><C-W>p

" Not collapse dir
let NERDTreeCascadeSingleChildDir = 0

" Not cascade open dir
let NERDTreeCascadeOpenSingleChildDir = 0

"-------------------------------------------------------------------------------
" NERDTree Setting
"-------------------------------------------------------------------------------

" Change symbols
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

"-------------------------------------------------------------------------------
" YouCompleteMe Setting
"-------------------------------------------------------------------------------

" check configure file exist
if !empty(glob("~/.vim/YCM/.ycm_extra_conf"))
  echoerr ".ycm_extra_conf must be exist!"
else
  " C-family Semantic Completion
  let g:ycm_global_ycm_extra_conf = '~/.vim/YCM/.ycm_extra_conf.py'
endif

" complete string
let g:ycm_complete_in_strings = 1

" complete string
let g:ycm_complete_in_comments = 1

" minimun char nums
let g:ycm_min_num_identifier_candidate_chars = 2

" scan id from comments and strings
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" close preview window
set completeopt-=preview

" scan id from tags
let g:ycm_collect_identifiers_from_tags_files = 1

" custom key bind
let g:ycm_key_invoke_completion='<C-Z>'

" apply YCM FixIt
noremap <leader>f<space> :YcmCompleter FixIt<CR>

"-------------------------------------------------------------------------------
" LeaderF Setting
"-------------------------------------------------------------------------------

" map F3
noremap <F3> :LeaderfBufTag<CR>

"-------------------------------------------------------------------------------
" airline Setting
"-------------------------------------------------------------------------------

" Integrating with powerline fonts
let g:airline_powerline_fonts = 1

" beautify tab line
let g:airline#extensions#tabline#enabled = 1

" airline Theme
let g:airline_theme = 'gruvbox'

"-------------------------------------------------------------------------------
" rainbow Setting
"-------------------------------------------------------------------------------

let g:rainbow_conf = {
      \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \ 	'*': {},
      \  'cmake': 0,
      \ }
      \}

" run automatically
let g:rainbow_active = 1

"-------------------------------------------------------------------------------
" UltiSnips Setting
"-------------------------------------------------------------------------------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-F>"
let g:UltiSnipsJumpBackwardTrigger="<C-B>"

"-------------------------------------------------------------------------------
" NERDCommenter Setting
"-------------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1

"-------------------------------------------------------------------------------
" auto-pairs Setting
"-------------------------------------------------------------------------------

" Fast Wrap
let g:AutoPairsShortcutFastWrap = '<C-W>'

" Backward Insert
let g:AutoPairsShortcutBackInsert = '<C-H>'

" disable Fly mode
let g:AutoPairsFlyMode = 0

"-------------------------------------------------------------------------------
" gruvbox Theme Setting
"-------------------------------------------------------------------------------

" True Color Support
set termguicolors

" set background
set background=light

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1

let g:gruvbox_termcolors = 256

let g:gruvbox_contrast_light = 'hard'

let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1

let g:gruvbox_invert_signs = 1
let g:gruvbox_invert_tabline = 1

let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1

colorscheme gruvbox

"-------------------------------------------------------------------------------
" Easy align Setting
"-------------------------------------------------------------------------------

" Map
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"-------------------------------------------------------------------------------
" echodoc Setting
"-------------------------------------------------------------------------------

" enable on startup
let g:echodoc_enable_at_startup = 1

" better with YCM
let g:echodoc#enable_force_overwrite = 1

"-------------------------------------------------------------------------------
" AutoFormat Setting
"-------------------------------------------------------------------------------

" map
noremap <F4> :Autoformat<CR>

" use autopep8
let g:formatdef_autopep8 = "'autopep8 - --aggressive --aggressive --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']

"-------------------------------------------------------------------------------
" My Setting
"-------------------------------------------------------------------------------

" Show number line
set number
" Show ruler
set ruler
" Syntax highlight
syntax on
" Set previous tab size
set tabstop=2
" Set current tab size
set softtabstop=2
" Set shift operate size
set shiftwidth=2
" Expand tab to space (except Makefile)
set expandtab
" Set autoindent 
set autoindent
" Show command info
set showcmd
" Jump to matched briefly
set showmatch
" No backup file
set nobackup
" No swap file
set noswapfile
" Improved
set nocompatible
" color current column
set cursorcolumn
" Highlight cursor line
set cursorline
" Right margin column
set colorcolumn=80
" highlight search
set hlsearch
" autoread when mode changed
set autoread
" ignore case
set ignorecase
" persistent undo history
set undofile
" enable mouse
set mouse=a
" split window to below
set splitbelow
" enable filetype detected
filetype on
" enable filetype plugin
filetype plugin on
" enable filetype indent
filetype indent on
" make backspace work better
set backspace=indent,eol,start
" not show mode
set noshowmode
" set cmdheight
set cmdheight=1
" Set encoding
set encoding=utf-8

" check undodir
let s:undo_dir = expand('~/.vim/undodir')
if !isdirectory(s:undo_dir)
  silent! call mkdir(s:undo_dir, 'p')
endif

" set undo directory
let &undodir = s:undo_dir

" Set Default File Fold Method
set foldmethod=indent

" Not fold automatically
set nofoldenable

" Use TAB in makefile
autocmd FileType make,go set noexpandtab

" set script executable automatically
autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin" | silent execute "!chmod +x <afile>" | endif | endif

" jump to the last cursor position when reopen
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" open help in new tab
cabbrev help tab help
cabbrev h tab h

" update date
function s:update_date()
  call cursor(6, 1)
  if search('@date') != 0
    let pos = line('.')
    call setline(pos, "  - @date      ".strftime("%Y-%m-%d %H:%M:%S"))
  endif
endfunction

" custom update date command
command UpdateDate :call s:update_date()

" HTML keymap timeout
autocmd FileType html set timeoutlen=200
" HTML auto close tags
autocmd FileType html inoremap <lt>/ </<C-x><C-o><Esc>==gi

" compile tex
autocmd FileType tex noremap <F5> :!latexmk %<CR>

" c skeleton
autocmd BufNewFile *.c call UltiSnips#Anon(join(readfile($HOME . "/.vim/Templates/skeleton.c"), "\n"))

" cpp skeleton
autocmd BufNewFile *.cc,*.cpp call UltiSnips#Anon(join(readfile($HOME . "/.vim/Templates/skeleton.cc"), "\n"))

" c/cpp header skeleton
autocmd BufNewFile *.h,*.hpp call UltiSnips#Anon(join(readfile($HOME . "/.vim/Templates/skeleton.h"), "\n"))

" python skeleton
autocmd BufNewFile *.py call UltiSnips#Anon(join(readfile($HOME . "/.vim/Templates/skeleton.py"), "\n"))
