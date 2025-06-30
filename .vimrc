set nocompatible
filetype plugin on
runtime macros/matchit.vim


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEntej * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'jonathanfilip/vim-lucius'
Plug 'romainl/Apprentice'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'francoiscabrol/ranger.vim'
Plug 'flrnprz/plastic.vim'
Plug 'tpope/vim-fugitive'
" Plug 'cocopon/iceberg.vim'
Plug 'sonph/onehalf'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }
" Plug 'rust-lang/rust.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
" Plug 'puremourning/vimspector'
call plug#end()
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1
au FileType ts,css,scss,html let b:prettier_exec_cmd = "prettier-stylelint"
nmap <Leader>z <Plug>(Prettier)


"autocmd Filetype cpp setlocal tabstop=4
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
let mapleader="\<Space>"
" let mapleader=","
"map <C-c> :s/^/\/\//<Enter>
"make it easy to edit vimrc file
nmap <Leader>tv :tabedit $MYVIMRC<CR>
" mapping bashrc
nmap <Leader>tb :tabedit ~/.bashrc<CR>
"--------------------< Space q> to quit file ----------
noremap <Leader>w :w<CR>
nnoremap <Leader>e :q<CR>
nnoremap <Leader>q :q!<CR>
"terminal
nnoremap <Leader>t :ter ++curwin<CR>
" insatllation of plugin coc for autom completation
"nnoremap ,cc :c\<!--<c-r>"--\>
"---------------Tab navigation recht and left ------------
noremap <Leader>l <C-W><C-L>
noremap <Leader>h <C-W><C-H>
"---------------------------go to Midlle of Line------------
map gm :call cursor(0, virtcol('$')/2)<CR>
"---------------------------comment block mapping -------------
"map <C-m> :s/^/\/\//<CR>
"--------------------copy function with visual prcess
nmap <F9>  jvaBVy
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap jj <Esc>
" make Y consistent with C and D.
nnoremap Y y$
nmap <leader><space> :nohlsearch<cr>
"most useful Line
set autowrite
set cursorline
set maxmempattern=50000


setlocal complete-=i


"----------------windows split-------------
"
nmap <C-H> gT
nmap <C-L> gt

" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
noremap <leader>y "+y
noremap <leader>p "+p


"In Vim, the gj and gk commands move by line on the screen rather than by line
"in the file. This sounds like it probably matches your description.
map j gj
map k gk
nnoremap <leader>r :<C-U>RangerChooser<CR>
nmap \n :setlocal relativenumber!<CR>
nmap \p :setlocal paste!<CR>
nmap \o :setlocal nowrap!<CR>
"	nmap \g :colorscheme gruvbox<CR> && :set background=dark<CR>
nmap \l :colorscheme lucius<CR>
nmap \d :colorscheme apprentice<CR>
" nmap \a :colorscheme apprentice<CR>
" nmap \l :colorscheme everforest<CR>
"	colorscheme gruvbox
" nmap \g :colorscheme apprentice<CR>
" nmap \v :colorscheme plastic<CR>
" nmap \i :colorscheme iceberg<CR>
" nmap \o :colorscheme onehalflight<CR>
"nmap \d :colorscheme challenger_deep<CR>
"nmap \n :colorscheme nordisk<CR>
map \c :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" faster arrow navigation, up and down.
nnoremap <C-k> :-5<CR>
inoremap <C-k> <Eksc>:-5<CR> i
nnoremap <C-j> :+5<CR>
inoremap <C-j> <Esc>:+5<CR> i
nnoremap <C-Up> :-5<CR>
inoremap <C-Up> <Esc>:-5<CR> i
nnoremap <C-Down> :+5<CR>
inoremap <C-Down> <Esc>:+5<CR> i
" jump to the previous function  for c++ function
nnoremap <silent> [f :cal search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function  for c++ function
nnoremap <silent> ]f :call search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>
"jumping inside line coma and poiont problem in germany keyboard
"
" nnoremap ; ,
" nnoremap , ;
" vnoremap ; ,
" vnoremap , ;

" left
" nnoremap H ^
" " right
" nnoremap L $
" " top
" nnoremap K H
" " down
" nnoremap J L
" " join
" nnoremap $ J
" nnoremap <leader><leader> <c-^>
nnoremap tt <c-^>

nnoremap <C-p> :call GoToRecentBuffer('previous')<CR>
nnoremap <C-n> :call GoToRecentBuffer('next')<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
" disable arrow top down left right, just olny key vim default key jklh 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"format code
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgN
"nnoremap <leader>cd :cd %:p:h<CR>
"  nnoremap <expr> e <SID>bufSwitch(v:count)
" switch betwnn buffer
" map <C-J> :bnext<CR>
"  map <C-K> :bprev<CR>
map <leader>v ggg?G
"
" List contents of all registers (that typically contain pasteable text).
" nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
" nmap <leader>y :%s/\(^\s*\n\)\{2,}/\r\r/g <cr>
" nmap <leader>c :%s/\s\+$//e \| silent! :%s/\(^\s*\n\)\{2,}/\r\r/g<CR>
"for editing source  code as programmier"
"augroup close_helpers_mappings
"    autocmd!
"    autocmd FileType c,cpp,html,java,javascript
"                \ inoremap () ()<ESC>i|
"                \ inoremap {} {}<ESC>i|
"                \ inoremap '' ''<ESC>i|
"                \ inoremap "" ""<ESC>i|
"                \ inoremap <> <><ESC>i|
"augroup END
"visual Mode
"vmap D y'>p
highlight ColorColumn ctermbg=0 guibg=#081C23
" set so
set scrolloff=2
"set backspace=indent,eol,start
set tabstop=4
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set hidden
"set hightlight search
set hlsearch
set incsearch
set ignorecase
" set nowrapscan "not search from beginn
set backspace=indent,eol,start
set clipboard=unnamed
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
set number
set relativenumber
"set so=999
"set lazyredraw
" Statusline (requires Powerline font)
" set laststatus=2
" statusline (requires Powerline font)
set laststatus=2
" set statusline=
" set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
" set statusline+=%< " Truncate line here
" set statusline+=%f\  " File path, as typed or relative to current directory
" set statusline+=%{&modified?'+\ ':''}
" set statusline+=%{&readonly?'\ ':''}
" set statusline+=%= " Separation point between left and right aligned items
" set statusline+=\ %{&filetype!=#''?&filetype:'none'}
" set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
"             \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
" set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
" set statusline+=\ 
" set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
" set statusline+=%-2v " Virtual column number
" set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|
" " ------------------------ 8< ------------------------
" " Statusline with highlight groups (requires Powerline font, using Solarized theme)
" set statusline=
" set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
" set statusline+=%< " Truncate line here
" set statusline+=%f\  " File path, as typed or relative to current directory
" set statusline+=%{&modified?'+\ ':''}
" set statusline+=%{&readonly?'\ ':''}
" set statusline+=%1*\  " Set highlight group to User1
" set statusline+=%= " Separation point between left and right aligned items
" set statusline+=\ %{&filetype!=#''?&filetype:'none'}
" set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
"             \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
" set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
" set statusline+=\ %* " Restore normal highlight
" set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
" set statusline+=%-2v " Virtual column number
" set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|jj 
set shortmess=a
set cmdheight=2
"}}}}}}}}}}}}}}} end  Settting


" autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
" autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
" autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
"clear register
command! RegClean for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor



"save vimrc by saving
augroup autosourcing
autocmd!
autocmd BufwritePost $MYVIMRC source %
augroup END
" augroup
" use clipboard register in linux when supported
if has("unix") && v:version >= 703
set clipboard+=unnamedplus
endif
let g:solarized_termcolors=256
let g:airline_theme='onehalfdark'
set t_Co=256
" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.
function! RangeChooser()
let temp = tempname()
" The option "--choosefiles" was added in ranger 1.5.1. Use the next line
" with ranger 1.4.2 through 1.5.0 instead.
"exec 'silent !ranger --choosefile=' . shellescape(temp)
if has("gui_running")
    exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
else
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
endif
if !filereadable(temp)
    redraw!
    " Nothing to read.
    return
endif
let names = readfile(temp)
if empty(names)
    redraw!
    " Nothing to open.
    return
endif
" Edit the first item.
exec 'edit ' . fnameescape(names[0])
" Add any remaning items to the arg list/buffer list.
for name in names[1:]
    exec 'argadd ' . fnameescape(name)
endfor
redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
"colorscheme solarized "set background=dark
colorscheme  lucius
" colorscheme  everforest
syntax on
"colorscheme plastic
"colorscheme  codedark
"colorscheme LuciusBlackLowContrast
"errro Message deactivate _Press Enter or type command to continu
let g:netrw_silent = 1
"lsp for ccls
" Key bindings for vim-lsp.
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>
"autoformat c++ programm header file and implementation
set tags=./tags,tags;$HOME
"for ccls plugin autocomplete c++
" Key bindings for vim-lsp.
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <silent> <M-=> :LspDocumentFormat<cr>
nn <f2> :LspRename<cr>
"buffer
autocmd BufEnter * silent! :lcd%:p:h
let g:buftabline_numbers = 1
" Allow switching to buffer #<n> by typing <n>e
"  function! s:bufSwitch(count)
"      if count >=# 1
"          return ":\<C-U>" . count . "b\<CR>"
"      endif
"      return 'e'
"  endfunction
function! GoToRecentBuffer(direction)
let limit     = 0
let startName = bufname('%')
let nowName   = bufname('%')
while (startName == nowName) && (a:direction == 'previous' ? limit < 100 : limit <= 100)
    execute a:direction == 'previous' ? "normal! \<C-o>" : "normal! 1\<C-i>"
    let nowName = bufname('%')
    let limit  += 1
endwhile
if startName == nowName
    echo "No " . a:direction . " file."
endif
endfunction
let g:html_indent_style1 = "inc"
" Clear trailing whitespace in selected file types on save
" autocmd BufWritePre *.h,cpp,*.ts,*.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e | :%s/\(^\s*\n\)\{2,}/\r\r/g
" autocmd BufWritePre *.h,cpp,*.ts,*.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e | :%s/\(^\s*\n\)\{2,}/\r\r/g
" autocmd BufWritePre *.h,*.hpp,cpp,*.ts,*.py,*.js,*.hs,*.html,*.css,*.scss  :silent! %s/\s\+$//e \| silent! :%s/\(^\s*\n\)\{2,}/\r\r/g<CR> \| norma gg=G
" autocmd BufWritePre *.h,cpp,*.ts,*.py,*.js,*.hs,*.html,*.css,*.scss,*.ts :silent g/^$/d
" autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
" autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
" autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
"Terminal Mapping
augroup BgHighlight
autocmd!
highlight ActiveWindow guibg=lightblue
autocmd WinEnter * call matchadd('ActiveWindow', '.*', 10, 1682)
autocmd WinLeave * call matchdelete(1682)
augroup END
" Logic for customizing the User1 highlight group is the following
" - if StatusLine colors are reverse, then User1 is not reverse and User1 fg = StatusLine fg
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642









" das ist for coc vim
" f hidden is not set, TextEdit might fail.
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" switch between buffer
set guifont=JetBrains\ Mono\ 13

" set pasttoggle=<F3>


" nnoremap <leader>b :!tmux run-shell -b -t 2 'cd /home/farka01/Desktop/working/REO_BACKEND && ./build_linux.sh '<CR><C-L>
" nnoremap <leader>b :call BuildProjectCpp()<CR><CR><CR>
" buid and run
nnoremap <leader>br :call BuildProjectCpp()<CR><CR><CR>
nnoremap <leader>cr :call CompileProjectCpp()<CR><CR><CR>

function BuildProjectCpp()
execute ':!tmux send-keys -t 2 "cd /home/farka01/Desktop/working/REO_BACKEND && ./build_linux.sh && build/Release/bin/RDC4.0" ENTER'
endfunction

function CompileProjectCpp()
let workingrelease='/home/farka01/Desktop/working/REO_BACKEND/build/Release'
let execPath="/home/farka01/Desktop/working/REO_BACKEND/build/Release/bin/RDC4.0"
silent execute ':!tmux send-keys -t 2 C-c ENTER'
silent execute ':!tmux send-keys -t 2 "clear" ENTER'
execute ':!tmux send-keys -t 2 "cd ' . workingrelease . ' && make && ' .  execPath . ' " ENTER'
endfunction

function BuildProjectCpp1()
" session=whatever
session=1
window=${session}:0
pane=${window}.2
execute ':!tmux send-keys -t "$pane" C-z ''echo "abdlillah farka"'' Enter'
execute ':!tmux select-pane -t "$pane"'
execute ':!tmux select-window -t "$window"'
execute ':!tmux atach-session -t "$session"'
" command! :w!
" execute ':!tmux run-shell -b -t 2 ''cd /home/farka01/Desktop/working/REO_BACKEND && ./build_linux.sh && cd build/Debug/bind && ./RDC4.0'' '
endfunction
" for rust

" let g:rustfmt_autosave = 1
" let g:rustfmt_emit_files = 1
" let g:rustfmt_fail_silently = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" nnoremap S :%s///cg<Left><Left><Left> 

  " Füge diese Zeilen zu deiner ~/.vimrc oder ~/.config/nvim/init.vim hinzu

" " Zum Wechseln zwischen TypeScript- und HTML-Dateien
" function! ToggleTypeScriptHtml()
"   let l:current_file = expand('%:p')
"   if l:current_file =~# '\.ts$'
"     execute 'edit' substitute(l:current_file, '\.ts$', '.html', '')
"   elseif l:current_file =~# '\.html$'
"     execute 'edit' substitute(l:current_file, '\.html$', '.ts', '')
"   endif
" endfunction

" Tastenkombination zum Aufrufen der Funktion
nnoremap <Space><Space> :call ToggleTypeScriptHtmlOrCppHeader()<CR>

function! ToggleTypeScriptHtmlOrCppHeader()
  let l:current_file = expand('%:p')
  if l:current_file =~# '\.ts$' || l:current_file =~# '\.html$'
    call ToggleTypeScriptHtml()
  elseif l:current_file =~# '\.cpp$' || l:current_file =~# '\.h$' || l:current_file =~# '\.hpp$'
    call ToggleCppHeader()
  endif
endfunction

nnoremap <Space><Space> :call ToggleTypeScriptHtmlOrCppHeader()<CR>

function! ToggleTypeScriptHtml()
  let l:current_file = expand('%:p')
  if l:current_file =~# '\.ts$'
    execute 'edit' substitute(l:current_file, '\.ts$', '.html', '')
  elseif l:current_file =~# '\.html$'
    execute 'edit' substitute(l:current_file, '\.html$', '.ts', '')
  endif
endfunction

function! ToggleCppHeader()
  let l:current_file = expand('%:p')
  if l:current_file =~# '\.cpp$'
    execute 'edit' substitute(l:current_file, '\.cpp$', '.h', '')
  elseif l:current_file =~# '\.h$'
    execute 'edit' substitute(l:current_file, '\.h$', '.cpp', '')
  elseif l:current_file =~# '\.hpp$'
    execute 'edit' substitute(l:current_file, '\.hpp$', '.cpp', '')
  endif
endfunction
let g:id_counter = 1

function! IncrementId()
  let g:id_counter = g:id_counter + 1
  return g:id_counter
endfunction


function! RenumberBuffersAlphabetically()
    " Holen Sie sich die Liste der Buffer mit alphabetischen Dateinamen
    let bufList = []

    " Iteriere über die Buffer
    for i in range(1, bufnr('$'))
        " Füge nur gelistete Buffer ohne netrw hinzu
        if buflisted(i) && getbufvar(i, "&filetype") != 'netrw'
            call add(bufList, fnamemodify(bufname(i), ':t'))
        endif
    endfor

    " Sortiere die Bufferliste alphabetisch
    let bufList = sort(bufList)

    " Schließe alle Buffer, außer dem aktuellen
    silent execute 'bwipeout! ' . join(filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "netrw" && v:val != bufnr("")'), ' ')


    " Öffne die Buffer jn der neuen Reihenfolge
    let i = 1
    for buf in bufList
        execute 'badd ' . i . ' ' . buf
        let i+=1
    endfor
endfunction

" Tastenkombination für das Skript
nnoremap <leader>ra :call RenumberBuffersAlphabetically()<CR>


function! GoToOuterBlock()
    let l:cur_line = line('.')
    let l:cur_col = col('.')
    normal! [
    let l:start_line = line('.')
    let l:start_col = col('.')
    normal! ]
    let l:level = 0
    while l:level >= 0
        let l:cur_char = getline('.')[col('.') - 1]
        if l:cur_char == '{'
            let l:level = l:level + 1
        elseif l:cur_char == '}'
            let l:level = l:level - 1
        endif
        normal! %
    endwhile
    let l:end_line = line('.')
    let l:end_col = col('.')
    if l:start_line != l:end_line || l:start_col != l:end_col
        call cursor(l:cur_line, l:cur_col)
    endif
endfunction

nnoremap <F8> :call GoToOuterBlock()<CR>
" Clang-format für C++-Dateien
autocmd FileType cpp nnoremap <buffer> <F3> :%!clang-format<CR>
" Astyle für C++-Dateien
autocmd FileType cpp nnoremap <buffer> <F4> :%!astyle<CR>
" golang
" disable all linters as that is taken care of by coc.nvim
" let g:go_diagnostics_enabled = 0
" let g:go_metalinter_enabled = []

" " don't jump to errors after metalinter is invoked
" let g:go_jump_to_error = 0

" " run go imports on file save
" let g:go_fmt_command = "goimports"

" " automatically highlight variable your cursor is on
" let g:go_auto_sameids = 0
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
