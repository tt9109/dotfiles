if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=/Users/nfujii/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/nfujii/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" surround by text-obj
NeoBundle 'tpope/vim-surround'
"cool status
NeoBundle 'itchyny/lightline.vim'
"replace like evil(emacs)
NeoBundle 'osyo-manga/vim-over'
" show recently used files on start
NeoBundle 'mhinz/vim-startify'
" align by option
NeoBundle 'vim-scripts/Align'
"run scripts  on vim
NeoBundle 'thinca/vim-quickrun'
" comment toggler
NeoBundle 'scrooloose/nerdcommenter'

" replace by text-obj
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'

" Syntax checking hacks for vim
NeoBundle 'scrooloose/syntastic'

" substitute preview
NeoBundle 'osyo-manga/vim-over'

" zen-coding
NeoBundle 'mattn/emmet-vim'

" neocomplete!
NeoBundle 'Shougo/neocomplete.vim'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"editor settings
syntax enable
colorscheme railscasts

"highlight horizontal 
set cursorline
highlight CursorLine ctermbg=Darkcyan
highlight CursorLine ctermfg=White
highlight Visual term=reverse cterm=reverse ctermfg=Darkcyan ctermbg=White

"highlight vertical
set cursorcolumn
highlight CursorColumn ctermbg=Blue
highlight CursorColumn ctermfg=Green

" vv to select to end of line
vnoremap v $h
" show line number
set number

" search options
" ignore upper lower case
set ignorecase
" search smarter
set smartcase  
" incremental search
set incsearch  
" highlight on search
set hlsearch  
" turn off highlight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"Converting tabs to spaces - Vim Tips Wiki http://vim.wikia.com/wiki/Converting_tabs_to_spaces
set expandtab 
set tabstop=2 
set shiftwidth=2 
set softtabstop=2
set autoindent 
set smartindent 

"enable lightline
set laststatus=2
"quickrun result on right
set splitright

"replace by text-obj
map R <Plug>(operator-replace)

"syntastic
let g:syntastic_mode_map = { 'mode': 'active','active_filetypes': ['ruby'] }
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1

"" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}

"neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let $VIMHOME = $HOME . '/.vim'
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'ruby' : $VIMHOME.'/dict/ruby.dict',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
