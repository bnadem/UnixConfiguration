set nocompatible
filetype plugin on
runtime macros/matchit.vim
"automatic installation vom plug autoload
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimenter * pluginstall --sync | source $myvimrc
endif

" register ccls c++ lanuage server.
" if executable('/home/farka01/Downloads/ccls/Release/ccls')
"     au User lsp_setup call lsp#register_server({
"                 \ 'name': 'ccls',
"                 \ 'cmd': {server_info->['ccls']},
"                 \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"                 \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
"                 \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"                 \ })
" else
"     echo 'ccls not executable'
" endif

"{{{{{{{{{{{{{{{{{{ Section Plugin Installation
call plug#begin()
"Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc-tsserver', {'do': {-> coc#utinl#install()}}
Plug 'flrnprz/plastic.vim'
Plug 'tpope/vim-fugitive'
Plug 'cocopon/iceberg.vim'
Plug 'sonph/onehalf'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
"Plug 'kamwitsta/nordisk'
"Colorshema
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
call plug#end()
"}}}}}}}}}}}}}}}}}}}}}}}}}}}}}End Plugin

"autocmd Filetype cpp setlocal tabstop=4
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"{{{{{{{{{{{{{{{{{{{{{{{{{ Maping
let mapleader="\<Space>"
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
""-----------------------maping to begin and End Of file -------------------
"nnoremap <CR> G
"nnoremap <BS> gg
"---------------Tab navigation recht and left ------------
"noremap <Leader>l gt
"noremap <Leader>h gT
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
" nnoremap L $
" nnoremap H 0
setlocal complete-=i


"----------------windows split-------------
"    nmap <C-J> <C-W><C-J>
"    nmap <C-H> <C-W><C-H>
"    nmap <C-K> <C-W><C-K>
"    nmap <C-L> <C-W><C-L>
"
nmap <C-H> gT
nmap <C-L> gt
" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
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
" nmap \l :colorscheme everforest<CR>
"	colorscheme gruvbox
nmap \g :colorscheme gruvbox<CR>
nmap \v :colorscheme plastic<CR>
nmap \i :colorscheme iceberg<CR>
nmap \o :colorscheme onehalflight<CR>
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
"format code
nmap <silent>  <c-x>  :call ClangFormatOnSave() %<CR>
nnoremap <leader>m :!makepp<CR>
nnoremap <leader>x *``cgn
nnoremap <leader>X #``cgN
"nnoremap <leader>cd :cd %:p:h<CR>
"  nnoremap <expr> e <SID>bufSwitch(v:count)
nnoremap tt <c-^>
nnoremap <C-p> :call GoToRecentBuffer('previous')<CR>
nnoremap <C-n> :call GoToRecentBuffer('next')<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
" switch betwnn buffer
" map <C-J> :bnext<CR>
"  map <C-K> :bprev<CR>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <leader>v ggg?G
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
"}}}}}}}}}}}}}}} end  Mapping
"{{{{{{{{{{{{{{ begin Setting
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
let g:clangFormatPath = '/home/farka01/Downloads/ccls/clang-llvm-8-0-0/bin/clang-format'
if	executable(clangFormatPath)
    function! ClangFormatOnSave()
        let l = line(".")
        let c = col(".")
        silent execute "%!/home/farka01/Downloads/ccls/clang-llvm-8-0-0/bin/clang-format"
        call cursor(l, c)
    endfunction
    "        autocmd BufWritePre *.h,*.hpp,*.cpp call ClangFormatOnSave()
else
    echo "not executral clangFormatpath"
endif
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


filetype plugin on
syntax on
