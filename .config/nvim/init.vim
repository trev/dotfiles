runtime macros/matchit.vim    " Run vim

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'altercation/vim-colors-solarized'

" Functionality
Plug 'vim-ruby/vim-ruby' " Ruby helper
Plug 'compactcode/open.vim' " Utils for opening files.
Plug 'geoffharcourt/vim-matchit' " Matchit.vim
Plug 'tpope/vim-git' " Syntax highlighting for git files
Plug 'tpope/vim-surround' " Give shortcut commands for automatic surrounding tags, brackets, quotes...
Plug 'tpope/vim-fugitive' " Git command helper
Plug 'tpope/vim-bundler' " Bundler helper
Plug 'tpope/vim-rails' " Rails helper
Plug 'tpope/vim-vinegar' " File browser
Plug 'tpope/vim-haml' " Syntax highlighting for HAML
Plug 'slim-template/vim-slim' " Syntax highlighting for SLIM
Plug 'airblade/vim-gitgutter' " Show git line change status in gutter
Plug 'vim-airline/vim-airline' " The cool status bar at the bottom of a vim pane
Plug 'vim-airline/vim-airline-themes' " Themes for status bar
Plug 'kchmck/vim-coffee-script' " Coffeescript helper
Plug 'MarcWeber/vim-addon-mw-utils' " Snipmate dependency
Plug 'tomtom/tlib_vim' " Snipmate dependency
Plug 'garbas/vim-snipmate' " Snippet tool
Plug 'honza/vim-snippets' " Snippets
Plug 'craigemery/vim-autotag' " Auto-update ctags files
Plug '/usr/local/opt/fzf' " Fuzzy finder dependency
Plug 'junegunn/fzf.vim' " Fuzzy finder
Plug 'majutsushi/tagbar' " Tagbar
Plug 'mhinz/vim-startify' " Save session layouts
Plug 'shime/vim-livedown' " Preview mardown files in browser
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion

call plug#end()

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
let &t_Co=256                     " Explicity set to 256 colors

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set laststatus=2                  " Show the status line all the time

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

" Copy to OSX clipboard
set clipboard=unnamed

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

" Startify settings
let g:startify_session_dir = '~/.config/nvim/session'

" ************************************************************
" (plugin) fzf.vim & ripgrep
" ************************************************************

let g:fzf_history_dir = '~/.fzf-history'

" Select a file to open
nnoremap <C-p> :Files<Cr>

" From :h fzf-vim-commands
" Text search with preview window
command! -bang -nargs=* Rg
 \ call fzf#vim#grep(
 \   'rg --column --hidden --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
 \   <bang>0 ? fzf#vim#with_preview('up:60%')
 \           : fzf#vim#with_preview(),
 \   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Airline settings
let g:airline_powerline_fonts = 1 " Use powerline fonts so the bar looks good
let g:airline#extensions#whitespace#enabled = 0 " Don't show whitespace stats

" Tagbar settings
nmap <F8> :TagbarToggle<CR>

" Vdebug settings
try
  " Include vdebug mappings if available. Useful when running code in a remote
  " enviromment like Vagrant/Virtualbox.
  " Example:
  " let g:vdebug_options = {
  " \ 'path_maps': { '/var/www/cool_site': '/Users/cooldude/Sites/cool_site' }
  " \}
  source ~/.config/nvim/.vdebug_mappings
catch
  " No vdebug mapping, no problem
endtry

" Custom mappings
map <leader>ht :set filetype=html<cr>
map <leader>ph :set filetype=php<cr>
inoremap pry<tab> binding.pry

" Automatic settings for specific file types
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType php  setlocal foldmethod=indent shiftwidth=4 tabstop=4

" Custom auto commands
" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line ("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

highlight clear SignColumn

" Delete the buffer; keep windows; create a scratch buffer if no buffers left
" Taken from: http://vim.wikia.com/wiki/Deleting_a_buffer_without_closing_the_window#Alternative_Script
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Create a mapping (e.g. in your .vimrc) like this:
map <leader>q <Plug>Kwbd

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Keep Vim from becoming unbareably slow when displaying long lines
" Especially bad with data URIs to represent images in CSS files
" set synmaxcol=150
