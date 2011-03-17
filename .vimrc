colorscheme desert
"NERDTree key-map  
map <F9> :NERDTreeToggle<CR>
map <F10> :TlistToggle<CR>

" Tab key-map
map <F5> :tabprevious<CR>
map <F6> :tabnext<CR>
map <C-N>   :tabnew .<CR>
map <C-C>  :tabclose<CR>
imap <F5> <ESC>:tabprevious<CR>i
imap <F6> <ESC>:tabnext<CR>i
imap <C-T>  <ESC>:tabnew .<CR>i
imap <C-C>  <ESC>:tabclose<CR>i

" Copy and Paste
let mapleader=","
map <leader>c "+y
map <leader>v "+p
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

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
set smarttab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示

if has("autocmd")
   autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
    autocmd FileType python setlocal et sta sw=4 sts=4﻿
   autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
   autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
   autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
   autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd")

"设置Java代码的自动补全
au FileType java setlocal omnifunc=javacomplete#Complete
let mapleader = "."
"绑定自动补全的快捷键<C-X><C-O>到<C-X>;
"imap <leader>  .<C-X><C-O>
imap <C-X>  <C-X><C-O>

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt4 /usr/include/qt4/ # for QT4
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/qt4
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>