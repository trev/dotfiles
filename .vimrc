set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'

" Functionality
Plugin 'vim-ruby/vim-ruby' " Ruby helper
Plugin 'tpope/vim-git' " Syntax highlighting for git files
Plugin 'tpope/vim-surround' " Give shortcut commands for automatice surrounding tags, brackets, quotes...
Plugin 'tpope/vim-fugitive' " Git command helper
Plugin 'tpope/vim-bundler' " Bundler helper
Plugin 'tpope/vim-rails' " Rails helper 
Plugin 'tpope/vim-vinegar' " File browser
Plugin 'tpope/vim-haml' " Syntax highlighting for HAML
Plugin 'airblade/vim-gitgutter' " Show git line change status in gutter
Plugin 'Lokaltog/powerline' " The cool status bar at the bottom of a vim pane
Plugin 'kchmck/vim-coffee-script' " Coffeescript helper

" Initialize powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
filetype plugin on

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
let g:Powerline_symbols = 'fancy' " Powerline fancy symbols
let &t_Co=256                     " Explicity set to 256 colors

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
set background=dark
colorscheme solarized
set cursorline
 hi CursorLine guibg=#1c1c1c ctermbg=235
" hi CursorColumn cterm=NONE ctermbg=lightblue ctermfg=white guibg=lightblue guifg=white

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=99

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"Custom mappings
map <leader>fb :FufBuffer<cr>
map <leader>ff :FufFile<cr>
map <leader>fc :FufCoverageFile<cr>
map <leader>ht :set filetype=html<cr>
map <leader>ph :set filetype=php<cr>

" Enable MakeGreencOSX clipboard
set clipboard=unnamed

" Tagbar ( http://majutsushi.github.com/tagbar/ )
nmap <F8> :TagbarToggle<CR>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

highlight clear SignColumn
