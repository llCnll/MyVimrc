" [[ "跳转上一个标题
" ]] "跳转下一个标题
" ]c "跳转到当前标题
" ]u "跳转到副标题
" zr "打开下一级折叠
" zR "打开所有折叠
" zm "折叠当前段落
" zM "折叠所有段落
"
" 启用TOC窗口自动调整, 允许TOC窗口在可能缩小时自动适应。它永远不会增加其默认大小（半屏），只会缩小。
let g:vim_markdown_toc_autofit = 1

" 1-禁用折叠
let g:vim_markdown_folding_disabled = 0

" 防止折叠文字
let g:vim_markdown_override_foldtext = 0

" 折叠级别, 默认1, 1-6
let g:vim_markdown_folding_level = 6

" 打开不折叠
set nofoldenable

" YMAL 高亮
let g:vim_markdown_frontmatter = 1

" JSON 高亮
let g:vim_markdown_json_frontmatter = 1

" 新起一行的缩进, 默认4
let g:vim_markdown_new_list_item_indent = 4

" 不需要 md 扩展名 作为markdown连接
let g:vim_markdown_no_extensions_in_markdown = 1

" 当使用 ge 进入链接的时候, 自动保存
let g:vim_markdown_autowrite = 1


" 使用 ge 用什么方式打开 tab vsplit hsplit current
let g:vim_markdown_edit_url_in = 'tab'


" 快捷键
" :Toc 垂直分屏打开目录
" :Toch 水平分屏
" :Toct 打开新tab
" :InsertToc [n] 插入当前目录 n = 1-6 代表插入那些级别的标题

