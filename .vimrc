set nocompatible " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"NeoBundle ( origin )
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'VimClojure'
NeoBundle 'scrooloose/syntastic'

"NeoBundle ( private )
NeoBundle 'tpope/vim-surround'
"zen-coding
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-javascript'
NeoBundle 'html5.vim'
"textobjectを利用してレジスタから置換できる
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
map R <Plug>(operator-replace)
"コメントアウト
NeoBundle 'scrooloose/nerdcommenter'
"vim上で実行できる
NeoBundle 'thinca/vim-quickrun'
"整形
NeoBundle 'vim-scripts/Align'
"ステータスラインがかっこよくなる
NeoBundle 'itchyny/lightline.vim'
"検索ワード入力時に、Tabキーを押すことにより、 検索ワードの補完をしてくれるvimスクリプト
NeoBundle 'vim-scripts/SearchComplete'
"ファイラー
NeoBundle 'kien/ctrlp.vim'
"キーを押す回数で挿入文字が変わる
NeoBundle 'kana/vim-smartchr'
"画面中にアルファベットが表示されてそこに飛べる
NeoBundle 'Lokaltog/vim-easymotion'
"fで移動したときに行またいで飛べる
NeoBundle 'rhysd/clever-f.vim'
"ctrlp拡張でレジスタ使える
NeoBundle 'LeafCage/yankround.vim'
"画面上に表示しながら置換ができる
NeoBundle 'osyo-manga/vim-over'
"SQL整形
NeoBundle 'vim-scripts/SQLUtilities'
"undo履歴を追える (need python support)
NeoBundle 'Gundo'

"保存時にctag実行
"NeoBundle 'soramugi/auto-ctags.vim'
"let g:auto_ctags = 1

"起動時に最近使ったファイルなどが表示される
NeoBundle 'mhinz/vim-startify'

"Tern for VimでVimのJavaScript補完環境を強化する | niwaringo() {Tumblr} http://niwaringo.tumblr.com/post/64149857660/tern-for-vim-vim-javascript
NeoBundle 'marijnh/tern_for_vim'

"urlを開く
"NeoBundle 'tyru/open-browser.vim'

"markdown
"NeoBundle 'tpope/vim-markdown'
"NeoBundle 'tyru/open-browser.vim'

"kana/vim-smartchr
"inoremap <expr> = smartchr#loop(' = ', ' == ', ' === ', '=')
inoremap <expr> * smartchr#loop('*','**','***','****',' * * * * * ')

"()の中にカーソル戻す
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>

"colorscheme
NeoBundle 'tomasr/molokai'
colorscheme molokai

filetype plugin indent on " required!
filetype indent on
syntax on

"editorsettings
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"ビジュアルモード時vで行末まで選択
vnoremap v $h

"行番号表示
set number

"横方向のハイライト。
set cursorline
highlight CursorLine ctermbg=Darkcyan
highlight CursorLine ctermfg=White
"選択が見づらいので
highlight Visual term=reverse cterm=reverse ctermfg=Darkcyan ctermbg=White

"縦方向のハイライト。
set cursorcolumn
highlight CursorColumn ctermbg=Blue
highlight CursorColumn ctermfg=Green

"neosnippet
" Plugin key-mappings.
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"自動でpaste modeに入る(変な改行されなくて済む)
"imap <D-v> ^O:set paste<Enter>^R+^O:set nopaste<Enter>

set ignorecase " 大文字小文字無視
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"<ESC><ESC> でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"文字コード自動判別
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
"lightline用
set laststatus=2
"quickrunの結果を右側表示にする
set splitright

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"ctrlp
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

"syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_loc_list=1

"surround_customization(数字はASCIIコード)
autocmd FileType php   let b:surround_63 = "<?php \r ?>" "?
autocmd FileType eruby let b:surround_61 = "<%= \r %>"   "=
autocmd FileType eruby let b:surround_37 = "<% \r %>"    "%
"autocmd FileType ruby let b:surround_61 = "<%= \r %>"   "=
"autocmd FileType ruby let b:surround_37 = "<% \r %>"    "%

"yankround
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" over.vim {{{
"over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
"カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
"コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!','g')<CR>!!gI<Left><Left><Left>
" }}}

"Gundo
nnoremap <silent> <Leader>g :GundoToggle<CR>

" startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
let g:startify_custom_header =
      \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
"デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
"let g:startify_custom_indices = []
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
      \ '~/.vimrc',
      \ '~/.zshrc',
      \ '~/.gitignore',
      \ '~/.gitconfig',
      \ ]

"open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"コンソールVimのヤンクでMacのクリップボードにコピー - Qiita [キータ] http://qiita.com/us10096698/items/f656b89ee7d0d02d37cb
set clipboard=unnamed,autoselect

"いまさら聞けないVim（6）：設定ファイルを作って自分の好みに改造 (1/3) - ＠IT http://www.atmarkit.co.jp/ait/articles/1107/21/news115.html
set backspace=start,eol,indent

"brewfile as ruby
au BufNewFile,BufRead brewfile setf ruby

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
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default'  : '',
      \ 'ruby'     : $HOME.'/.vim/dict/ruby.dict',
      \ 'php'      : $HOME.'/.vim/dict/php.dict',
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
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
