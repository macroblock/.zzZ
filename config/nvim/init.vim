if !has('nvim')
    set nocompatible
"    set t_Co=256
endif
set t_Co=256

syntax on
syntax enable
colorscheme desert

let mapleader = ','
"----------------------Searching--------------------------"
set hlsearch
set incsearch
"----------------------Split Management-------------------"
set splitbelow
set splitright
"----------------------Mappings---------------------------"
"Edit vim config file
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
"Highlight removal.
nnoremap <leader><space> :nohlsearch<cr>
nnoremap * :let @/='\<<c-r>=expand("<cword>")<cr>\>'<cr>:set hlsearch<cr>
"----------------------Auto-commands----------------------"
"Automatically source the vimrc file on save.
augroup AutoLoadVimConfig
    autocmd!
    " autocmd BufWritePost vimrc source %
    autocmd BufWritePost init.vim,vimrc source %
augroup end

set tabstop=4
set shiftwidth=4
set smarttab

set expandtab
set softtabstop=4

set autoindent
set cindent

set wrap
set linebreak

set cursorline
set number
"set statusline=2

"set ruler
set showtabline=2 " show only when at least two tabs
set laststatus=2  " show statusline always
set noshowmode    " mode text (e.g. -- INSERT -- for insert mode)
set showcmd

set encoding=utf-8

" status line settings
set statusline=
set statusline +=[%n]                       "buffer number
set statusline +=\ %<%F                     "full path
set statusline +=\ %m                       "modified flag
set statusline +=\ %=%l/%L\ (%3P)         "Rownumber/total (%)
set statusline +=\ %4v                      "virtual column number
set statusline +=\ %{getfsize(expand(@%))}  "file size 
set statusline +=\ %y                       "file type
set statusline +=%{&ff}                     "file format
set statusline +=\ 0x%04B\                  "character under cursor

" when searching, ignore case if all letters lowercase
set ignorecase
set smartcase
set showmatch
set listchars=tab:▸\ ,eol:¬
" Use your leader key + l to toggle on/off
map <leader>l :set list!<cr> " Toggle tabs and EOL 
" Scrolloff 
set scrolloff=3

" rotate buffers
" nnoremap <silent> [b :bprevious!<cr>
" nnoremap <silent> ]b :bnext!<cr>
" nnoremap <silent> [B :bfirst!<cr>
" nnoremap <silent> ]B :blast!<cr>


" autoinstall dein
let g:settings = get(g:, 'settings', {})
let g:settings.fsep = '/'

function! s:joinPath(...)
    let ret = ''
    for val in a:000 " a:000 - list of arguments
        let ret .= g:settings.fsep . val
    endfor
    return ret
endfunction

let g:settings.dein_installed = 0
let g:settings.plugin_bundle_dir = s:joinPath(expand('<sfile>:h'), 'plugins')
let s:fsep = '/'
let g:dein_dir = g:settings.plugin_bundle_dir . s:joinPath('repos', 'github.com', 'Shougo', 'dein.vim')

if filereadable(g:dein_dir . s:joinPath('README.md'))
    let g:settings.dein_installed = 1
else
    if executable('git')
        exec '!git clone https://github.com/Shougo/dein.vim ' . g:dein_dir
        let g:settings.dein_installed = 1
    else
        echohl WarningMsg | echom "You need install git!" | echohl None
    endif
endif

exec 'set runtimepath+=' . g:dein_dir
call dein#begin(g:settings.plugin_bundle_dir)
call dein#add('Shougo/dein.vim')
"call dein#add('chriskempson/base16-vim')
call dein#add('vim-scripts/bufexplorer.zip')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-scripts/SyntaxAttr.vim')
call dein#add('guns/xterm-color-table.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('SirVer/ultisnips')
call dein#add('majutsushi/tagbar')
call dein#add('fatih/vim-go')
call dein#add('Shougo/deoplete.nvim')
"call dein#add('zchee/deoplete-go')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#end()
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-default-dark

set clipboard+=unnamedplus

" SyntaxAttr settings
nnoremap -a :call SyntaxAttr()<cr>
  
if has('nvim')
    " Terminal settings
    function! s:mapTerminalWindowCmd(key)
        execute "tnoremap <C-w>" . a:key . " <C-\\><C-n><C-w>" . a:key
        execute "tnoremap <C-w><C-" . a:key . "> <C-\\><C-n><C-w>" . a:key
    endfunction

    tnoremap <esc> <c-\><C-n>
    call s:mapTerminalWindowCmd("w")
    call s:mapTerminalWindowCmd("h")
    call s:mapTerminalWindowCmd("j")
    call s:mapTerminalWindowCmd("k")
    call s:mapTerminalWindowCmd("l")

    " auto insert mode when enter terminal buffer
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | else | :stopinsert | endif
endif

"" Colors
" nnoremap <F9> :w<cr>:so %<cr>:call InitColors()<cr>
" 
" function! InitColors()
"     hi Normal        ctermfg=DarkYellow       ctermbg=None   cterm=None
"     hi Identifier    ctermfg=fg         ctermbg=NONE   cterm=NONE
"     hi Statement     ctermfg=Grey      ctermbg=NONE   cterm=None
"     hi Type          ctermfg=White     ctermbg=NONE   cterm=Bold
"     hi Comment       ctermfg=Black ctermbg=None   cterm=Bold
"     hi Constant      ctermfg=DarkCyan       ctermbg=NONE   cterm=NONE 
"     hi Special       ctermfg=DarkCyan ctermbg=NONE   cterm=Bold
"     hi PreProc       ctermfg=DarkGreen      ctermbg=NONE   cterm=NONE
" endfunction

"autocmd VimEnter,BufAdd * call InitColors()

" highlight current line
"highlight cursorline term=NONE cterm=NONE ctermbg=DarkBlue ctermfg=NONE 
" set cursorline
"augroup CursorLine
"  autocmd!
"  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  autocmd WinLeave * setlocal nocursorline
"augroup end 

" default the statusline to green when entering Vim
hi statusline ctermfg=black ctermbg=green cterm=none term=none
hi statuslineNC ctermfg=black ctermbg=11 cterm=none term=none
" ttimeoutlen for InsertLeave autocommand 
set timeoutlen=1000 ttimeoutlen=50
autocmd InsertEnter * hi statusline ctermfg=black ctermbg=red cterm=none
autocmd InsertLeave * hi statusline ctermfg=black ctermbg=10 cterm=none

"----------------------wildmenu---------------------------"
set wildmenu
set wildmode=longest:list,full
"----------------------buffers----------------------------"
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>

"----------------------Vim-go-----------------------------"
set autowrite   " autowrite before build

noremap <C-j> :cnext<CR>
noremap <C-k> :cprevious<CR>
nnoremap <leader>q :cclose<CR>

function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$' 
        call go#cmd#Build(0)
    endif
endfunction

" autocmd FileType go nnoremap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_list_height = 10 " quickfix list height
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set completeopt=preview,menuone
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
