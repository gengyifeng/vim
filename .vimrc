
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'

Plugin 'alvan/vim-closetag'
Plugin 'hrp/EnhancedCommentify'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe' 
Plugin 'pignacio/vim-yapf-format'
call vundle#end()

"NERDTree key-map  
map <F9> :NERDTreeToggle<CR>
map <F10> :TlistToggle<CR>

" Tab key-map
map <F5> :tabprevious<CR>
map <F6> :tabnext<CR>
map <C-T>   :tabnew .<CR>
map <C-C>  :tabclose<CR>
imap <F5> <ESC>:tabprevious<CR>i
imap <F6> <ESC>:tabnext<CR>i
imap <C-T>  <ESC>:tabnew .<CR>i
imap <C-C>  <ESC>:tabclose<CR>i

" 窗口区域切换,Ctrl+↑↓←→ 来切换
imap <silent> <C-left> <esc><C-W><left>
vmap <silent> <C-left> <esc><C-W><left>
nmap <silent> <C-left> <C-W><left>
imap <silent> <C-right> <esc><C-W><right>
vmap <silent> <C-right> <esc><C-W><right>
nmap <silent> <C-right> <C-W><right>
imap <silent> <C-up> <esc><C-W><up>
vmap <silent> <C-up> <esc><C-W><up>
nmap <silent> <C-up> <C-W><up>
imap <silent> <C-down> <esc><C-W><down>
vmap <silent> <C-down> <esc><C-W><down>
nmap <silent> <C-down> <C-W><down>
" 代码块缩进
vmap <TAB> >
vmap <S-TAB> <
" Copy and Paste
"let mapleader=","
"map <leader>c "+y
"map <leader>v "+p

" keep paste format, but conflict with supertag!
set paste

"TList
let Tlist_Show_One_File=1        "设置只显示1个文件的tag
let Tlist_Exit_OnlyWindow=1        "设置Tlist在只显示Tlist窗口时退出vim
let Tlist_Use_Right_Window=1    "设置Tlist在右侧显示
let Tlist_Sort_Type="name"        "设置按名称排序
let Tlist_GainFocus_On_ToggleOpen=1 "获得焦点
let Tlist_Process_File_Always=1 "实时更新
"编码
set fileencodings=utf-8,gbk,big5
" set termencoding=utf-8
" set encoding=prc

"鼠标
set mouse=a
" 显示光标位置"
set ruler
" 显示不完整命令
set showcmd
" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on
" 语法高亮显示
syntax on
" 在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 增量搜索 
set incsearch

" 搜索高亮
set hlsearch

" 不要闪烁
set novisualbell
set nostartofline   " don't jump to first character when paging
"正确地处理中文字符的折行和拼接
set formatoptions+=mM

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn
" 根据文件类型进行缩进
set noautoindent
set nosmartindent
set nocindent


" 制表符
set tabstop=2

" 统一缩进
set softtabstop=2
set shiftwidth=2
" 设置backspace的工作方式
set backspace=indent,eol,start
" 用空格代替制表符
set expandtab
" 行间跳转
set whichwrap=b,s,h,l,<,>,[,]
" 不要换行
set wrap

" 在行和段开始处使用制表符
set smarttab
if has("gui_running")
       " See ~/.gvimrc
       set guifont=Monospace\ 10  " use this font
       set lines=50       " height = 50 lines
       set columns=100        " width = 100 columns
       set background=light   " adapt colors for background
       set selectmode=mouse,key,cmd
       set keymodel=
   else
       colorscheme desert    " use this color scheme
       set background=dark        " adapt colors for background
   endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    au Filetype *.py,*.pyw set syntax python
    au FileType *.py,*.pyw set tabstop=4
    au FileType *.py,*.pyw set softtabstop=4
    au FileType *.py,*.pyw set shiftwidth=4
    " When using mutt, text width=72
    au FileType mail,tex set textwidth=72
    au FileType cpp,c,java,sh,pl,php,asp,html,xml  set autoindent
    au FileType cpp,c,java,sh,pl,php,asp,html,xml  set smartindent
    au FileType cpp,c,java,sh,pl,php,asp,html,xml  set cindent
    "au BufRead mutt*[0-9] set tw=72

    " Automatically chmod +x Shell and Perl scripts
    "au BufWritePost   *.sh             !chmod +x %
    "au BufWritePost   *.pl             !chmod +x %

    " File formats
    au BufNewFile,BufRead  *.pls    set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
    " 浅色高亮当前行
    au InsertLeave * se nocul
    au InsertEnter * se cul
endif

autocmd FileType *.py,*.pyw set tabstop=2 set softtabstop=2 set shiftwidth=2

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4
" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/qt4
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 设置注释
vmap = <Esc><Esc>:call EnhancedCommentify('yes','comment',line("'<"),line("'>"))<CR><CR>
" 取消注释
vmap - <Esc><Esc>:call EnhancedCommentify('yes','decomment',line("'<"),line("'>"))<CR><CR>

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -1,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BinPackArguments" : "false",
            \ "BinPackParameters" : "false",
            \ "DerivePointerAlignment" : "false",
            \ "PointerAlignment" : "Left",
            \ "Standard" : "C++11"}

" map to <Leader>c in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

let g:yapf_format_style = "google"
" map to <Leader>f in python code
"autocmd FileType *.py,*.pyw nnoremap <buffer><Leader>f :<C-u>YapfFormat<CR>
"autocmd FileType *.py,*.pyw vnoremap <buffer><Leader>f :YapfFormat<CR>
"map <Leader>f :YapfFullFormat<CR>
imap <Leader>f <ESC>:YapfFormat<CR>i
vmap <Leader>f :YapfFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

autocmd FileType c,cpp,objc ClangFormatAutoEnable

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 让vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>    pumvisible()?"\<C-y>":"<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 
"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tag_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-/>'
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" 
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的g:syntastic_warning_symbol
"和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

