" ===========
" == NERDTree
" ===========
" 打开文件自动打开NERDTree
" autocmd vimenter * NERDTree
" 唯一打开的窗口是NERDTree时, 自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 菜单栏位置
let g:NERDTreeWinPos = "left"
" 1-显示隐藏文件 0-不现实隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=35
" 显示行号
let NERDTreeShowLineNumbers=1
" unkonwn
let NERDTreeAutoCenter=1

" 打开/关闭目录
map <leader>dt :NERDTreeToggle<cr>
" 打开指定的书签
map <leader>db :NERDTreeFromBookmark<Space>
" 打开当前文目录
map <leader>df :NERDTreeFind<cr>

