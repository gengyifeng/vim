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
"set paste

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


" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4
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


" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/qt4
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" 设置注释
vmap = <Esc><Esc>:call EnhancedCommentify('yes','comment',line("'<"),line("'>"))<CR><CR>
" 取消注释
vmap - <Esc><Esc>:call EnhancedCommentify('yes','decomment',line("'<"),line("'>"))<CR><CR>
