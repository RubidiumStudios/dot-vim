set nocompatible
syntax on
filetype off

"Use Pathogen to manage plugins
call pathogen#infect()
call pathogen#helptags()

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Layout
set laststatus=2
set number
set splitbelow
set splitright
set showcmd
set cmdheight=2

" Status Line
set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
set statusline+=%h%m%r%w                     " flags
set statusline+=%f\                          " file name
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}\ 
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


" Behaviour
set magic
set formatoptions=cq2
set errorbells
set novisualbell
set nowrap
set sidescroll=1
set linebreak                                "when wrap is on, will wrap at appropriate positions"
set wrapscan                                 "searches wrap around EOF
set whichwrap=27                             "bitwize representation of "b,s,<,>,[,]"
set clipboard=unnamed
set encoding=utf-8
set listchars=tab:→\ ,trail:∙,extends:⊳,precedes:⊲,nbsp:□
"set listchars+=eol:⤸ "if you want to see EOLs
set list

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" MakeGreen
nmap  <silent> <Leader>m <Plug>MakeGreen

" Tags
set tags=./tags,tags;/
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
nmap <silent> <Leader>T:!ctags -R --languages=Ruby,C,C++,Javascript,Coffeescript --langmap='ruby:+.rake.builder.haml'<CR>

syntax on
filetype on
filetype plugin on
filetype indent on

" Scheme
set colorcolumn=80
color vividchalk " was navajo-midnight
highlight ColorColumn ctermbg=1
let html_use_css=1
let html_output_xhtml=1

" Backups
set backup
set backupcopy=yes  "backup to copy, save over original -- for programs that watch for changes to original files
set backupdir=~/tmp/vim-backups,/tmp/vim-backups,. 

" Commands
set shell=/bin/bash
let g:ruby_doc_command='open'
let g:jquery_doc_command='open'

" Slime config
let g:slime_target = "tmux"

" Rails
let g:rails_level = 3
let g:rails_menu = 2

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeShowHidden=1
map  <C-D> :NERDTreeTabsToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

function s:setupWrapping()
  set ft=text
  set wrap
  set wm=2
  set textwidth=78
  set formatoptions+=t
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  set ft=markdown
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()
au BufRead,BufNewFile {README,Readme} call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Unimpaired configuration
" Bubble single lines
nmap <C-M-Up> [e
nmap <C-M-Down> ]e
" Bubble multiple lines
vmap <C-M-Up> [egv
vmap <C-M-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10
