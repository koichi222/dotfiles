set nocompatible
filetype off
 
set rtp+=~/dotfiles/.vim/vundle.git/
call vundle#rc()
 
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle "rails.vim"
Bundle "tpope/vim-fugitive"
Bundle "git://git.wincent.com/command-t.git"
Bundle 'basyura/jslint.vim'

filetype plugin indent on

"-----------------------------
" apperance
"-----------------------------
" タイトルをウインドウ枠に表示する
set title
" タイトルの文字列
"set titlestring=haru

"バイナリファイルの非印字可能文字を16進数で表示
set display=uhex

" 行番号を表示する
"set number
" ルーラーを表示
set ruler
" ルーラの内容を指定する書式は 'statusline' のものと同様
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
"999 行, 888 文字" の代わりに "999L, 888C" を表示。
set shortmess+=I

" 入力中のコマンドをステータスに表示する
set showcmd
"コマンドラインに使われるスクリーン上の行数
set cmdheight=2

"カーソルの上または下に表示する最小限の行数
set scrolloff=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
" ステータスラインの色
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

"-----------------------------
" edit
"-----------------------------
" 括弧にカーソルが移ると対括弧がハイライト表示
set showmatch
"バックスペースにてインデントを削除可能にする
" indent : 行頭の空白
" eol : 改行
" start : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
"クリップボードを使用(vimエディタが「+clipboard」でコンパイルされていること :versionで確認)
set clipboard=unnamed
"paste をオンにすれば autoindent がオフの状態のトグル
set pastetoggle=<F2>
"GUI用のオプション
"a:ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーションとクリップボードを共有するオプション。
set guioptions+=a
"補完候補を表示する。コマンドライン補完が拡張モードで行われる
set wildmenu
"Vimがテキストを整形する方法を決定するオプション
set formatoptions+=M

" ---indent---
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
" オートインデントを有効にする（新しい行のインデントを現在の行と同じにする）
set autoindent
"C言語スタイルのインデント機能が有効
"set cindent
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使う
set expandtab

"-----------------------------
" search
"-----------------------------
"検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
"set incsearch
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
"set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチ(検索文字を打ち込むと即検索)を使わない
set noincsearch
"ビジュアルで選択検索

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"
"
"rails vimのsql補完をオフに
let g:rails_dbext=0


" jslint.vim
function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" rails
  au BufNewFile,BufRead app/**/*.rhtml set ft=mason fenc=utf-8 ts=2 et
  au BufNewFile,BufRead app/**/*.rb    set ft=ruby  fenc=utf-8 ts=2 et
  au BufNewFile,BufRead app/**/*.erb   set ft=ruby  fenc=utf-8 noexpandtab
