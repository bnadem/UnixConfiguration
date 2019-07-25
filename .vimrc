" Necesary for lots of cool vim things
set nocompatible

"automatic installation vom plug autoload 
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimenter * pluginstall --sync | source $myvimrc
else
	echo "loades auto plug"
	
endif
" Register ccls C++ lanuage server.
""register server
if executable('cquery')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'cquery',
				\ 'cmd': {server_info->['cquery']},
				\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
				\ 'initialization_options': { 'cacheDirectory': '/tmp/cache' },
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
				\ })
else
       	echo 'not load cquery'
endif
"if executable('ccls')
"  au User lsp_setup call lsp#register_server({
"     \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
"      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"     \ })
"else
"	echo 'ccls not executable'
"endif
let g:LanguageClient_serverCommands = {
    \ 'cpp': [expand('~/cquery/build/cquery'), '--log-file=/tmp/cq.log'],
    \ 'c': [expand('~/cquery/build/cquery'), '--log-file=/tmp/1cq.log'],
    \ }


call plug#begin()
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'pdavydov108/vim-lsp-cquery'
Plug 'tomasiser/vim-code-dark'
"Plug 'Rip-Rip/clang_complete', {'for': ['c', 'cpp'], 'do': 'make install'}
call plug#end()
"for ccls plugin autocomplete c++
" Key bindings for vim-lsp.
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <silent> <M-=> :LspDocumentFormat<cr>
nn <f2> :LspRename<cr>

"let g:lsc_server_commands = {
"  \ 'c': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"  \ 'cpp': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"  \ }
"
set nocompatible
set backspace=indent,eol,start
autocmd Filetype cpp setlocal tabstop=4


set tabstop=4
set hidden
set signcolumn="yes"  
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
let mapleader="\<Space>"
" register ccls c++ lanuage server.
"if executable('ccls')
"   au user lsp_setup call lsp#register_server({
"      \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_direct"ory(lsp#tils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
"      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"     \ })
"endif
" insatllation of plugin coc for autom completation 
"-----------------------Mapping------------------------------------

"map <C-c> :s/^/\/\//<Enter>
"make it easy to edit vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<CR>
" mapping bashrc 
nmap <Leader>eb :tabedit ~/.bashrc<CR>

noremap <Leader>w :w<CR>
"--------------------< Space q> to quit file ---------- 
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :q!<CR>



augroup autosourcing 
	autocmd!
	autocmd BufwritePost $MYVIMRC source % 
	augroup

	""-----------------------maping to begin and End Of file -------------------
	"nnoremap <CR> G
	"nnoremap <BS> gg

	"---------------Tab navigation recht and left ------------
	noremap <leader><Leader>l gt
	noremap <leader><Leader>h gT
	"---------------------------comment block mapping -------------

	"map <C-m> :s/^/\/\//<CR> 
	"--------------------copy function with visual prcess
	nmap <F9>  jvaBVy
	inoremap II <Esc>I
	inoremap AA <Esc>A
	inoremap OO <Esc>O
	inoremap jj <Esc>
	"-------------------set hightlight search

	set hlsearch 
	set incsearch
	nmap <leader><space> :nohlsearch<cr>
	"----------------windows split-------------
	"nmap <C-J> <C-W><C-J>
	"nmap <C-H> <C-W><C-H>
	"nmap <C-K> <C-W><C-K>
	"nmap <C-L> <C-W><C-L>

	nmap <Leader>j <C-W><C-J>
	nmap <Leader>h <C-W><C-H>
	nmap <Leader>k <C-W><C-K>
	nmap <Leader>l <C-W><C-L>

	"set linespace=15

	set backspace=indent,eol,start


	set clipboard=unnamed
	" use clipboard register in linux when supported
	if has("unix") && v:version >= 703
		set clipboard+=unnamedplus
	endif
	" Copy and paste
	vmap <C-c> "+yi
	vmap <C-x> "+c
	vmap <C-v> c<ESC>"+p
	imap <C-v> <ESC>"+pa
	syntax on
	let g:solarized_termcolors=256
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
	nnoremap <leader>r :<C-U>RangerChooser<CR>
	"In Vim, the gj and gk commands move by line on the screen rather than by line
	"in the file. This sounds like it probably matches your description.
	map j gj
	map k gk

	" Send more characters for redraws
	set ttyfast
	" Enable mouse use in all modes
	set mouse=a
	"
	" " Set this to the name of your terminal that supports mouse codes.
	" " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
	set ttymouse=xterm2


	set number
	set relativenumber
	nmap \l :setlocal number!<CR>
	nmap \o :setlocal paste!<CR>
	nmap \p :setlocal nowrap!<CR>

	"colorscheme solarized "set background=dark
    colorscheme  lucius
    "colorscheme  codedark
	"colorscheme LuciusBlackLowContrast
"	nmap \g :colorscheme gruvbox<CR> && :set background=dark<CR>
	nmap \m :colorscheme lucius<CR>
"	colorscheme gruvbox
	nmap \g :colorscheme gruvbox<CR> 
	map \c :let &background = ( &background == "dark"? "light" : "dark" )<CR>


	"errro Message deactivate _Press Enter or type command to continu
	set shortmess=a
	set cmdheight=2
	let g:netrw_silent = 1


	"lsp for ccls
	" Key bindings for vim-lsp.
	nn <silent> <M-d> :LspDefinition<cr>
	nn <silent> <M-r> :LspReferences<cr>
	nn <f2> :LspRename<cr>
	nn <silent> <M-a> :LspWorkspaceSymbol<cr>
	nn <silent> <M-l> :LspDocumentSymbol<cr>


	set tags=./tags,tags;$HOME
