lua require('settings')
lua require('plugins')


" ########### for Mac Color activation ###########
syntax on

" ########### Basic Settings ###########
set background=dark
"colorscheme PaperColor
"set guifont=Monaco:h18
"set ai
"set smartindent
" set nu
"set ts=4
"set expandtab
"set shiftwidth=4
"set colorcolumn=120

" ########### For xpositioning ###########
"set cursorline
"hi CursorLine cterm=bold
"set cursorcolumn

" ########### Tagbar ###########
"nmap <F6> :TagbarToggle<CR>


" ########### NERDTree ###########
"map <F5> :NERDTreeToggle<CR>


" ########### Project ###########
"let g:proj_window_width = 35
"let g:proj_flags = "imst"

" ########### Key Mapping ###########
"map <C-c> "+y
"map <A-Up> [c
"map <A-Down> ]c
"map <C-F11> :set incsearch
"map <A-F11> :set noincsearch

" ########### Last Place memory ###########
" Uncomment the following to have Vim jump to the last position when
" reopening a file
 if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" ######### For copy to clibboard #########
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" ######### For copy to clibboard #########
"let g:go_imports_autosave = 0
"let g:go_completion_enabled = 1
""let g:go_completion_auto_type = 1
"let g:go_completion_auto_gopkgs = 1

" ######### neocomplete #########
"let g:acp_enableAtStartup = 1
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" ######### backspace #########
set backspace=indent,eol,start

