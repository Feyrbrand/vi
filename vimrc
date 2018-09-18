"Colors{{{
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
syntax enable
"}}}
"Spaces & Tabs{{{
set tabstop=4
set softtabstop=4
set expandtab
"}}}
"Ui Config{{{
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
"}}}
"Searching{{{
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
"}}}
"Folding{{{
set foldenable
set foldlevelstart=0
set foldnestmax=5
nnoremap <space> za
set foldmethod=indent
"}}}
"Movement{{{
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]
"}}}
"Leader Shortcuts{{{
let mapleader=","
inoremap jk <esc>
nnoremap <leader>u :GundoToogle<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
"}}}
"CtrlP fuzzy searcher{{{
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
""}}}
"Launch Config{{{
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
""}}}
"Tmux{{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
""}}}
"Autogroups{{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
""}}}
"Backups in temp folder{{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
""}}}
"Custom Functions{{{
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
""}}}
"Organization foldering{{{
set foldmethod=marker
set foldlevel=1
set foldclose=all
set modelines=1
"vim:foldmethod=marker:foldlevel=0
"set foldermarker={{{,}}}
"}}}


























