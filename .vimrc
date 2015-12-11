execute pathogen#infect()
filetype plugin indent on

set laststatus=2
let g:airline_theme='murmur'


set colorcolumn=80

set t_Co=256
syntax on
colorscheme wombat256i

map <F6> :set nonumber! <CR>

"comment out lines with #
map <Leader># :s:^:#:<CR>:nohl<CR>
"comment out lines with //
map <Leader>\ :s:^://:<CR>:nohl<CR>
"remove comments from lines beginning with #
map <Leader>-# :s:#:^:<CR>:nohl<CR>
"remove comments from lines beginning with //
map <Leader>-\ :s://:^:<CR>:nohl<CR>
"remap Perl array to hash, ignore topic variable $_
map <Leader>h :s/\$_\@!\(\w\+\),*/\1 => \$\1,\r\t/g<CR>
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" tips for writing prose in vim, from http://alols.github.com/2012/11/07/writing-prose-with-vim/
command! Prose inoremap <buffer> . .<C-G>u|
            \ inoremap <buffer> ! !<C-G>u|
            \ inoremap <buffer> ? ?<C-G>u|
            \ setlocal spell spelllang=sv,en
            \     nolist nowrap tw=74 fo=t1 nonu|
            \ augroup PROSE|
            \   autocmd InsertEnter <buffer> set fo+=a|
            \   autocmd InsertLeave <buffer> set fo-=a|
            \ augroup END

command! Code silent! iunmap <buffer> .|
            \ silent! iunmap <buffer> !|
            \ silent! iunmap <buffer> ?|
            \ setlocal nospell list nowrap
            \     tw=74 fo=cqr1 showbreak=… nu|
            \ silent! autocmd! PROSE * <buffer>

command! -range=% SoftWrap
            \ <line2>put _ |
            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x
