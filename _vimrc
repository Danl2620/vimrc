
set nocompatible
filetype off

" function! BuildCommandT(info)
" 	" info is a dictionary with 3 fields
" 	" - name:   name of the plugin
" 	" - status: 'installed', 'updated', or 'unchanged'
" 	" - force:  set on PlugInstall! or PlugUpdate!
" 	if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
" 		!c:\Ruby22-x64\DevKit\devkitvars.bat && cd ruby\command-t && ruby extconf.rb && make
" 	endif
" endfunction
" 
" " This doesn't actually seem to work
" function! BuildYCM(info)
" 	" info is a dictionary with 3 fields
" 	" - name:   name of the plugin
" 	" - status: 'installed', 'updated', or 'unchanged'
" 	" - force:  set on PlugInstall! or PlugUpdate!
" 	if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
" 
" 		!mkdir "c:\temp\ycm_build" & cd "c:\temp\ycm_build" &&
" 					\ cmake -G "Visual Studio 12 Win64" -DPATH_TO_LLVM_ROOT="c:\Users\mdyckhoff\Projects\llvm-3.9.1" -DUSE_PYTHON2=1
" 					\ -DPYTHON_INCLUDE_DIR="C:\Python27\include"
" 					\ -DPYTHON_LIBRARY="C:\Python27\libs\python27.lib" .
" 					\ "c:\Program Files\Vim\vimfiles\plugged\youcompleteme\third_party\ycmd\cpp" &&
" 					\ cmake --build . --target ycm_core --config Release
" 
" 	endif
" endfunction

" manually install https://github.com/junegunn/vim-plug
" then restart vim and call PlugInstall to grab all these plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'nfvs/vim-perforce'		" automatic Perforce checkout
Plug 'tomtom/tcomment_vim'		" nice comment handling
Plug 'tpope/vim-surround'		" for controlling braces
Plug 'tpope/vim-repeat'			" allow repeating of plugin maps
Plug 'itchyny/lightline.vim'	" nice statusline plugin
Plug 'Raimondi/delimitMate'		" auto closing of parens, etc
" Plug 'wincent/command-t', { 'do': function('BuildCommandT') }
" Plug 'valloric/youcompleteme' ", { 'do' : function('BuildYCM') } , 'commit' : 'cb57569' }
Plug 'tenfyzhong/vim-gencode-cpp'	" auto generate function brass
Plug 'wlangstroth/vim-racket'	" racket syntax etc, for dc/dcx files
Plug 'vim-scripts/a.vim'		" open alternate file (h/cpp)
Plug 'tikhomirov/vim-glsl'		" shader shading
Plug 'AndrewRadev/linediff.vim'	" diff chunks of code
" Plug 'vim-scripts/visual_studio.vim' " plz work
Plug 'wlangstroth/vim-racket' " Racket mode
Plug 'kien/rainbow_parentheses' " rainbow parenthesis

call plug#end()


" tidy up the indent style slightly
filetype plugin indent on

" play nicely with visual studio
:set shiftwidth=4
:set softtabstop=4
:set tabstop=4
:set encoding=utf-8

" makes backspace do what you think it does
:set backspace=2

" fun shit
:set showcmd
:set noea
:set mouse=a
:set nowrap
:set ruler
:set background=dark
:set guifont=consolas:h10:b

:set undofile

:syntax on 

:set fileformats=unix,dos
:set guioptions=t
:set textwidth=120
:set vb t_vb=
:set switchbuf=usetab
:set wh=1
:set hls
:set showmatch
:set ignorecase
:set laststatus=2
:set history=1000
:set nrformats=octal,hex
:set gcr=a:blinkon0
:set formatoptions-=ro
:set clipboard=unnamed
:set novisualbell
:set complete=.,w,b,u,t
:set tabline=%!MyTabLine()
:set scrolloff=4
:set previewheight=3
:set hidden
:set updatetime=10
:set cindent
:set cinoptions=(1s

:set dir^=c:\vimtmp\swp
:set backupdir=c:\vimtmp\backup
:set undodir=c:\vimtmp\undo

" UGH terrible idea. Breaks a load of plugins.
if $SHELL == "/bin/tcsh"
	:set shell=c:/ndibin/cygwin/bin/tcsh.exe
	:set shellcmdflag=-c
	:set shellxquote=\"
	:set shellslash
endif

" for Fracas
autocmd BufNewFile,BufRead *.frc set syntax=racket

" my personal settings
:let g:maxd_COpenHeight=15

" :let g:maxd_NDGame = $GAMENAME
" :let g:maxd_NDBranch = $GAMEBRANCH
" :let g:maxd_NDPath = 'c:\perforce\' . g:maxd_NDBranch

" set up the path properly
:let &path = ""

" :let &path .= ',' . g:maxd_NDPath . '\shared\src\'
" :let &path .= ',' . g:maxd_NDPath . '\shared\src\**'
" :let &path .= ',' . g:maxd_NDPath . '\' . g:maxd_NDGame . '\src\'
" :let &path .= ',' . g:maxd_NDPath . '\' . g:maxd_NDGame . '\src\**'
" :let &path .= ',c:\build\mdyckhoff\code\' . g:maxd_NDBranch . '\' . g:maxd_NDGame . '\ps4\default\dch\'
" :let &path .= ',c:\build\mdyckhoff\code\' . g:maxd_NDBranch . '\' . g:maxd_NDGame . '\ps4\default\dch\**'
" :let &path .= ',c:\build\mdyckhoff\code\' . g:maxd_NDBranch . '\unittest-gamelib\ps4\default\dch\'				" because fuck you
" :let &path .= ',c:\build\mdyckhoff\code\' . g:maxd_NDBranch . '\unittest-gamelib\ps4\default\dch\**'			" because fuck me

" exec ":cd " . g:maxd_NDPath

" command-t
:let g:CommandTWildIgnore="\*.swp,\*.ppt,\*.txt,\*.html"

" :let g:CommandTFileScanner = 'watchman'
" exec ":map <Leader>t :CommandT " . g:maxd_NDPath . "<CR>"
" :map <Leader>l :CommandTLine<CR>

" perforce
:let g:perforce_open_on_change = 1

" tcomment
if !exists("g:tcommentPreC")
    let g:tcommentPreC = {
                \ 'commentstring': '#if 0%s#endif',
                \ 'rxbeg': '#if 0\+',
                \ 'rxend': '',
                \ 'rxmid': '',
				\ 'col': 0,
                \ 'replacements': g:tcomment#replacements_c
                \ }
endif
call tcomment#type#Define('c_pre_block', g:tcommentPreC)

" you complete me
:let g:ycm_server_python_interpreter = "C:/Python27/python.exe"
:let g:ycm_confirm_extra_conf = 0
:let g:ycm_autoclose_preview_window_after_insertion = 1
:let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
:let g:ycm_server_keep_logfiles = 1
:let g:ycm_server_log_level = 'debug'

:map <Leader>f :YcmCompleter FixIt<CR>

" clang format
:let g:clang_format_path = "c:/ndibin/clang-format-ndi.exe"

:nmap <silent> <Leader>= :set opfunc=ClangFormat<CR>g@
:vmap <silent> <Leader>= :pyf c:/perforce/main/tools/src/scripts/clang-format/clang-format.py<cr>

" lightline
:let g:lightline = {
		\		'colorscheme': 'wombat',
		\ 		'active': {
		\ 		  	'left': [
		\						[ 'mode', 'paste' ],
		\						[ 'filename', 'readonly', 'modified' ]
		\					],
		\   	
		\ 		  	'right': [
		\						[ 'lineinfo' ],
		\						[ 'percent' ],
		\						[ 'fileformat', 'filetype' ]
		\					]
		\		},
		\ 		'inactive': {
		\ 		  	'left': [
		\						[ 'filename', 'readonly', 'modified' ]
		\					],
		\ 			'right': [
		\						[ 'lineinfo' ],
		\						[ 'percent' ]
		\					]
		\		}
		\	}

" ctags
:let g:ctags_path="c:/bin/ctags554/ctags.exe"
:let g:ctags_args='--c-types=cfgsu --vim-types=f --if0=yes --language-force=c -ICOMPILE_TIME_ASSERT+ -IDECLARE_ALIGNED_TYPE+ -IRESTRICTED_DATA_ARRAY+ -IRESTRICTED_PTR+'
:let g:ctags_statusline=1
:let generate_tags=1
" :let &tags = g:maxd_NDPath . '\ctags.out'

" global highlighting changes
:hi	Pmenu				guibg=DarkRed
:hi	Normal				guibg=Black			guifg=White			gui=NONE
:hi	TabLineSel			guibg=DarkRed		guifg=White			gui=italic 
:hi	CursorLineNr		guifg=Red
:hi	YcmErrorLine		guibg=#3f0000
:hi	CommandTCharMatched	guifg=#40ffff		gui=bold

" comment mappings
:map <F2> <C-_><C-_>
:map <S-F2> :TCommentAs c_pre_block<CR>
:map <F3> :cn<CR>
:map <S-F3> :cp<CR>
:map <C-F3> :let @/ = ""<CR>
:map <F4> :lnext<CR>
:map <S-F4> :lprevious<CR>
:map <C-F4> :lclose<CR>

:map <F9> :P4edit<CR>
:map <S-F9> :P4revert<CR>
:map <F10> :silent exec "!start p4v -cmd \"diff " . expand('%:p') . "\""<CR>
:map <C-F10> :silent exec "!start p4v -cmd \"annotate " . expand('%:p') . "\""<CR>

:map <Leader>o :A<CR>
:map <Leader>O :AS<CR>

:map <Leader>g :GenDefinition<CR>
:map <Leader>G :GenDeclaration<CR>

" search for current visual selection
:vmap / "vy/<C-R>v<CR>

" movement mappings
:map <C-UP>		:wincmd k<CR>
:map <C-DOWN>	:wincmd j<CR>
:map <C-RIGHT>	:wincmd l<CR>
:map <C-LEFT>	:wincmd h<CR>

:map <C-TAB>		:tabn<CR>
:map <C-S-TAB>		:tabp<CR>

:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>

:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

:nnoremap <leader>x :cclose<CR>
:nnoremap <leader>v :vert sp<CR>
:nnoremap <leader>c :sp<CR>
:nnoremap <leader>q :q<CR>

" I like holding down shift too long
:command! -bang W w<bang>
:command! -bang Q q<bang>
:command! -bang WQ wq<bang>
:command! -bang QA qa<bang>

" nice header completion commands
:command! Fc call FHfunc(0)
:command! Fh call FHfunc(1)

au BufRead,BufNewFile *.dc set filetype=lisp

" nice function to change the tab line
" based on code taken from an email "Re: Tab bar" to the vim@vim.org mailing
" list, authored by A.J.Mechelynck [antoine dot mechelynck at skynet dot be]
function! MyTabLine()

	let s = ''
	let t = tabpagenr()
	let i = 1

	while i <= tabpagenr('$')

		let buflist = tabpagebuflist(i)
		let winnr = tabpagewinnr(i)

		" correct style
		let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')

		" this lets us select using the mouse
	    let s .= '%' . i . 'T'

		" set the name of the window
		let file = bufname(buflist[winnr - 1])
		let file = fnamemodify(file, ':p:t')

		" default file name if file has no name
		if file == ''
			let file = '[No Name]'
		endif

		" add nice indicators for readonly and modified status
		let spaced = 0
		if getbufvar(buflist[winnr - 1], "&mod")
			let file .= ' [+]'
			let spaced = 1
		endif
		if getbufvar(buflist[winnr - 1], "&readonly")
			if spaced == 0
				let file .= ' '
				let spaced = 1
			endif
			let file .= '[RO]'
		endif

		let s .= ' ' . file . ' %* '
		let i = i + 1

	endwhile

	" finish up
	let s .= '%T%#TabLineFill#%='
	let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
	return s

endfunction

" header completion function
function! FHfunc(isheader)
    let fnc = expand("%:r")
    let filename = expand("%:t")
    
    if (fnc == "")
		let fnc = "-"
    endif

	let fnc = substitute(fnc,"\\", "\/", "g")
	
	let filedef = substitute(expand("%:t"),".*","\\U\\0","")
    
	let @d =		"/*\n"
	let @d = @d.	" * Copyright (c) 2018 Naughty Dog, Inc.\n"
	let @d = @d.	" * A Wholly Owned Subsidiary of Sony Computer Entertainment, Inc.\n"
	let @d = @d.	" * Use and distribution without consent strictly prohibited.\n"
	let @d = @d.	" */\n\n"
    
    if a:isheader==0
		let @d = @d.   "#include \"".fnc.".h\"\n\n"
    else
		let filedef = substitute(expand("%:tr"),".*","\\U\\0","")
		let filedef = substitute(filedef,"[.-]","_","g")
		let class = substitute(filename,"\.h$","","")
		let @d = @d. "#pragma once\n\n#ifndef ".filedef."\n#define ".filedef."\n\n"
		let @d = @d. "#endif // ".filedef
    endif
    
    put! d

endfunction

function! QuickFixToArgs()
	" Building a hash ensures we get each buffer only once
	let buffer_numbers = {}
	for quickfix_item in getqflist()
		let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
	endfor

	let files = join(map(values(buffer_numbers), 'fnameescape(v:val)'))
	exec ":args " . files
endfunction

function! P4ReplaceHeader(header, newheader)
	let headerdelim = substitute(a:header,"/", "\\\\/", "g")
	let newheaderdelim = substitute(a:newheader,"/", "\\\\/", "g")

	exec ":cs f i " . a:header
	call QuickFixToArgs()

	exec ":argdo P4edit"
	exec ":argdo %s/".headerdelim."/".newheaderdelim."/ge | update"
endfunction

function! P4ReplaceSymbol(symbol, newsymbol)
	exec ":cs f s " . a:symbol
	call QuickFixToArgs()

	exec ":argdo P4edit"
	exec ":argdo %s/\\<".a:symbol."\\>/".a:newsymbol."/geI | update"
endfunction

function! ClangFormat(type)
	let start = getpos("'[")[1]
	let end = getpos("']")[1]
	let l:lines = start . ":" . end
	:pyf c:/perforce/main/tools/src/scripts/clang-format/clang-format.py
endfunction

" MAPPINGS!
" \sq   YcmCompleter GoToImprecise
" \ss   YcmCompleter GoTo
" \si   YcmCompleter GoToInclude
" \sd   YcmCompleter GoToDeclaration
" \sf   YcmCompleter GoToDefinition
" \sa   cs find s
" \sc   cs find c

" :let g:maxd_Search = '<Leader>s'
" exec "nmap " . g:maxd_Search . "<CR> <nop>"

" set up custom YCM mappings
" function! MapYCM()
" 
" 	" set search highlight to current word, do a cscope search for the current
" 	" word, open the quickfix window, and jump to the first result (:cr)
" 	exec "nmap " . g:maxd_Search . "q :YcmCompleter GoToImprecise<CR>"
" 	exec "nmap " . g:maxd_Search . "s :YcmCompleter GoTo<CR>"
" 	exec "nmap " . g:maxd_Search . "i :YcmCompleter GoToInclude<CR>"
" 	exec "nmap " . g:maxd_Search . "d :let @/=expand(\"<cword>\")<CR>:YcmCompleter GoToDeclaration<CR>"
" 	exec "nmap " . g:maxd_Search . "f :let @/=expand(\"<cword>\")<CR>:YcmCompleter GoToDefinition<CR>"
" 
" endfunction

" set up custom CScope mappings
" function! MapCScope()
" 
" 	" remove the default mappings
" 	for character in split("cdefgist", '\zs')
" 
" 		exec "silent! nunmap <C-\\>" . character
" 		exec "silent! nunmap <C-Space>" . character
" 		exec "silent! nunmap <C-Space><C-Space>" . character
" 
" 	endfor
" 
" 	let search_term = "<C-R>=expand(\"<cword>\")<CR>"
" 
" 	" set search highlight to current word, do a cscope search for the current
" 	" word, open the quickfix window, and jump to the first result (:cr)
" 	exec "nmap " . g:maxd_Search . "a :let @/=expand(\"<cword>\")<CR>:cs find s " . search_term . "<CR>:copen " . g:maxd_COpenHeight . "<CR>:cr<CR>"
" 	exec "nmap " . g:maxd_Search . "c :let @/=expand(\"<cword>\")<CR>:cs find c " . search_term . "<CR>:copen " . g:maxd_COpenHeight . "<CR>:cr<CR>"
" 
" endfunction
" 
" call MapYCM()

" cscope settings
if has("cscope")

    set nocscopeverbose

    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

	cs reset
	" exec 'cs add ' . g:maxd_NDPath . '\cscope.out ' . g:maxd_NDPath

	" call MapCScope()

    set cscopeverbose
	set cscopequickfix=c-,d-,e-,f-,g-,i-,s-,t-
    set cscopetag
    set csto=0

endif


