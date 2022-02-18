set encoding=utf-8
"filetype plugin indent on
syntax on

"-------------------------------------------------------------------------------
 " Plugins
 "-------------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-smooth-scroll'
Plug 'itchyny/lightline.vim'
Plug 'itsfeng/vim-todo-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

"-------------------------------------------------------------------------------
" Plugin Options
"-------------------------------------------------------------------------------
" Lightline Options
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ }

" vim-todo-lists
" let g:VimTodoListsMoveItems = 0

"-------------------------------------------------------------------------------
" Syntax Highlighting
"-------------------------------------------------------------------------------
" Markdown
au BufNewFile,BufFilePre,BufRead *.md,*.markdown,*.mdown,*.mkd,*.mkdn,README.md  set filetype=markdown textwidth=80

" Smooth Scrolling Keybinds
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"-------------------------------------------------------------------------------
" Leader Mappings & Shortcuts
"-------------------------------------------------------------------------------
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>git :! cd ~/gits/gh/tasks/ && git add tasks.todo.md && git commit -m "commit" && git push<CR>
" map <Leader>d :r!date "+\%F-[\%a]"<CR>

" Toggle relative line numbers
set number relativenumber            " Enable line numbers
nnoremap <Leader>nu :set number! relativenumber!<CR>

" Quickly insert an empty new line without entering insert mode
    nnoremap <Leader>o o<Esc>0"_D
    nnoremap <Leader>O O<Esc>0"_D
"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------
colorscheme gruvbox
set background=dark

" Show Blanks
"set list
"set listchars=tab:▸\ ,eol:¬

"-------------------------------------------------------------------------------
" vim Options
"-------------------------------------------------------------------------------
set mouse=a
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling
set fileformats=unix,dos,mac
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

set foldmethod=manual
set foldlevelstart=20
"set foldnestmax=10
"set nofoldenable
"set foldlevel=2

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

