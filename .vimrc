"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> MySelf
"    -> Helper functions
"    -> Plugin
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
" 查看命令历史
set history=500

" Enable filetype plugins
" 开启文件类型检查, 并且载入与该类型对应的规则, 比如编辑的是py文件, vim就会找python的缩进规则 可以通过 :set rtp 查看当前的$vimruntime
" filetype on $vimruntime/scripts
" filetype plugin on $vimruntime/ftpplugin.vim
" file indent on $vimruntime/indent.vim filetype plugin on $vimruntime/ftpplugin.vim
" file indent on $vimruntime/indent.vim
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
" 自动加载文件, 手动加载文件的命令 e!
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
" 设置领导键
let mapleader = ","

" Fast saving
" 通过领导键快速保存
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" 给:W 给它别的功能, 当权限拒绝的时候依旧可以保存
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" 移动光标的时候, 头/尾 稳定保留7行
" set so=7
set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
" 在命令模式下可以用tab模糊匹配
set wildmenu
" full 缺省值 用第一个完整的匹配补全，然后下一个匹配，依此类推
" longest,full, 用最长的子串补全，然后是每个完整的匹配
" list:full 列出所有的匹配并用每个完整的匹配补全
" list,full 列出所有的匹配而不补全，然后是每个完整的匹配
" longest,list, 用最长的子串补全，然后列出所有的可能性
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
" 显示当前位置
set ruler

" Height of the command bar
" 底部命令行的高度
set cmdheight=1

" A buffer becomes hidden when it is abandoned
" 允许在有未保存的修改时切换缓冲区, 此时的修改由vim负责保存
set hidden

" Configure backspace so it acts as it should act
" 解决插入模式下退格键失效的问题
" eol : 如果插入模式下在行开头，想通过退格键合并两行，需要设置eol
" start : 要想删除此次插入前的输入，需设置这个
" indent : 如果用了:set indent,:set ai 等自动缩进，想用退格键将字段缩进的删掉，必须设置这个选项。否则不响应
set backspace=eol,start,indent
" 允许 <Left> <Right> h l 到达行首/行尾的时候可以移动到上一行/下一行
set whichwrap+=<,>,h,l

" Ignore case when searching
" 搜索时候忽略大小写
set ignorecase

" When searching try to be smart about cases 
"如果同时打开了ignorecase, 那么对于只有一个大写字母的搜索词, 将大小写敏感: 其他情况都是大小写不敏感. 比如, 搜索Test时, 将不匹配test; 搜索test时, 将匹配Test
set smartcase

" Highlight search results
" 搜索时开启高亮
set hlsearch

" Makes search act like search in modern browsers
" 输入搜索模式时, 每输入一个字符, 就自动跳到第一个匹配的结果.(逐字高亮)
set incsearch

" Don't redraw while executing macros (good performance config)
" 使用宏的时候不显示过程, 直接显示结果
set lazyredraw

" For regular expressions turn magic on
" magic就是设置哪些元字符要加反斜杠哪些不用加的
" magic (/m)：除了 $ . * ^ 之外其他元字符都要加反斜杠.
" nomagic (/M)：除了 $ ^ 之外其他元字符都要加反斜杠.
" /v (即 very magic 之意): 任何元字符都不用加反斜杠
" /V (即 very nomagic 之意): 任何元字符都必须加反斜杠
" 在有特殊需要时, 直接通过 /v/m/M/V 即可
set magic

" Show matching brackets when text indicator is over them
" 光标遇到圆括号, 方括号, 大括号时, 自动高亮对应的另一个圆括号, 方括号和大括号.
set showmatch
" How many tenths of a second to blink when matching brackets
" 设置显示配对括号的时间, 单位0.1秒
set matchtime=1

" No annoying sound on errors
" 关闭错误信息响铃
" set noerrorbells
" 关闭出错时候发出视觉提醒, 通常是屏幕闪烁
" set novisualbell
" 置空错误铃声的中断代码
set visualbell t_vb=
" set tm=500
set timeoutlen=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set visualbell t_vb=
endif

" Add a bit extra margin to the left
" 设置折叠区域的宽度, 最大值12
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" 开启语法高亮
syntax enable

" Enable 256 colors palette in Gnome Terminal
" 启用256色
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" 系统的配色方案放在/usr/share/vim/vim82/colors/
" 更改配色方案
try
    colorscheme desert
catch
endtry

" 设置背景颜色
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    " 不显示工具栏
    set guioptions-=T
    " 使用非GUI标签页行
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
" fileformats用于处理文件格式, 告诉vim将unix文件格式作为第一选择, 将dos作为第二选择
" set ffs=unix,dos,mac
set fileformats=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
" 不创建备份文件. 默认情况下, 文件保存时, 会额外创建一个备份文件, 它的文件名是在原文件名的末尾, 再添加一个波浪号(~).
set nobackup
" 进入写入时候的文件备份
" set nowb
set nowritebackup
" 不创建交换文件. 交换文件主要用于系统崩溃时恢复文件. 文件的开头是 . 结尾是 .swp
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" 使用空格代替tab
set expandtab

" Be smart when using tabs ;)
" tab将是4个空格, 想要删除这个tab需要按4下, 设置后按一下即可
" 在行和段开始处使用制表符
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
" 不在单词中间折行, 只有在遇到指定的符号才发生折行(空格, 逗号, 其他标点符号)
" set lbr
set linebreak
" 设置光标超过500的时候折行
" set tw=500
set textwidth=500

" 启用自动对齐, 把上一行的对齐格式应用到下一行
" set ai "Auto indent
set autoindent
" 依据上面的格式, 智能选择对齐方式
" set si "Smart indent
set smartindent
" 自动折行
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" 在可视模式下 把选择的进行查找
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
" 取消高亮
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" 分屏的相关操作
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
" 关闭当前缓冲区
map <leader>bc :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" 关闭所有缓冲区
map <leader>ba :bufdo bd<cr>

" 下一个缓冲区
map <leader>bn :bnext<cr>
" 前一个缓冲区
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
" tab的相关操作
" 创建新的tab
map <leader>tn :tabnew<cr>
" 只保留当前tab
map <leader>to :tabonly<cr>
" 关闭当前tab
map <leader>tc :tabclose<cr>
" 移动当前tab到n的位置
map <leader>tm :tabmove 
" 打开第n个tab
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
" 当前tab与最后一个tab进行来回切换
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
" 进入到当前缓冲的文件的目录
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  " set stal=2
  " 何时显示带有标签页的行, 0-永远不会, 1-至少有两个标签页的时候才会, 2-永远会
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" 打开上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" 是否显示状态栏, 0表示不显示, 1表示只在多窗口显示, 2总是显示
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" 开启/关闭 拼写检查
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" 粘贴模式开关
map <leader>pp :setlocal paste!<cr>

" 显示行号, 和相对行号
set number
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MySelf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插入/普通模式下光标
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

" 如果行尾有多余的空白字符, 则显示出来
set list
set listchars=tab:▸\ ,trail:▫

" 突出当前行
set cursorline

" 插入模式下返回开头/结尾
imap <C-a> <Esc>I
imap <C-e> <Esc>A

""新建.c,.h,.sh,.java文件，自动插入文件头
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"""定义函数SetTitle，自动插入文件头
"func SetTitle()
"    "如果文件类型为.sh文件
"    if &filetype == 'sh'
"        call setline(1,"\#!/bin/bash")
"        call append(line("."), "")
"    elseif &filetype == 'python'
"        call setline(1,"#!/usr/bin/env python")
"        call append(line("."),"# coding=utf-8")
"        call append(line(".")+1, "")
"
"    elseif &filetype == 'ruby'
"        call setline(1,"#!/usr/bin/env ruby")
"        call append(line("."),"# encoding: utf-8")
"        call append(line(".")+1, "")
"
"        "    elseif &filetype == 'mkd'
"        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
"    else
"        call setline(1, "/*************************************************************************")
"        call append(line("."), "	> File Name: ".expand("%"))
"        call append(line(".")+1, "	> Author: ")
"        call append(line(".")+2, "	> Mail: ")
"        call append(line(".")+3, "	> Created Time: ".strftime("%c"))
"        call append(line(".")+4, " ************************************************************************/")
"        call append(line(".")+5, "")
"    endif
"    if expand("%:e") == 'cpp'
"        call append(line(".")+6, "#include<iostream>")
"        call append(line(".")+7, "using namespace std;")
"        call append(line(".")+8, "")
"    endif
"    if &filetype == 'c'
"        call append(line(".")+6, "#include<stdio.h>")
"        call append(line(".")+7, "")
"    endif
"    if expand("%:e") == 'h'
"        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
"        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
"        call append(line(".")+8, "#endif")
"    endif
"    if &filetype == 'java'
"        call append(line(".")+6,"public class ".expand("%:r"))
"        call append(line(".")+7,"")
"    endif
"endfunc
""新建文件后，自动定位到文件末尾
"autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" 填写要加载的插件
" let plugNames = [
"             \ 'scrooloose/nerdtree',
"             \ 'xuyuanp/nerdtree-git-plugin',
"             \]
let plugNames=[]
" 树形目录
call add(plugNames, 'scrooloose/nerdtree')
" 树形目录配套的git样式
call add(plugNames, 'xuyuanp/nerdtree-git-plugin')
" coc
" call add(plugNames, 'neoclide/coc.nvim, {"branch": "release"}')

call plug#begin('~/.vim/plugged')

for name in plugNames
    Plug name
endfor
" Plug 'connorholyday/vim-snazzy'
" Plug 'valloric/youcompleteme'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" 自动加载插件配置文件(命名格式: {用户}_{插件名称}.vim) 不存在就会一直报错...
for name in plugNames
    let findSplitIndex = stridx(name, ',')
    let plugName=substitute(strpart(name, 0, findSplitIndex < 0 ? strlen(name) : findSplitIndex), '\/', '_', 'g')
    let plugOrder=printf("source ~/.vim/plugconfig/%s.vim", plugName)
    " echo plugOrder
    execute plugOrder
endfor

