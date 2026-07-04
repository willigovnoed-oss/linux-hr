" Linux HR default vim config -- green hacker theme, no external plugins needed

syntax on
filetype plugin indent on

set number
set relativenumber
set ignorecase
set smartcase
set incsearch
set hlsearch
set expandtab
set shiftwidth=2
set tabstop=2
set nowrap
set scrolloff=4
set laststatus=2
set showcmd
set background=dark

" minimal green-on-black look that works in any terminal, no colorscheme file needed
highlight Normal       ctermfg=green ctermbg=black
highlight Comment      ctermfg=darkgreen
highlight LineNr       ctermfg=darkgreen ctermbg=black
highlight CursorLineNr ctermfg=green ctermbg=black cterm=bold
highlight StatusLine   ctermfg=black ctermbg=green cterm=bold
highlight Search       ctermfg=black ctermbg=green
highlight Visual       ctermfg=black ctermbg=darkgreen

set statusline=%f\ %m%r%h%w\ [%{&ff}]%=%l,%c\ %p%%
