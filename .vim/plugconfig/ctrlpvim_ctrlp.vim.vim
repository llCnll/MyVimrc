" 默认映射
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" 调用时,  除非制定了起始目录, 否则CtrlP将根据此变量设置本地工作目录
" 'c' 当前目录
" 'r' 包含这些目录或文件之一的最接近的祖先,(.git, .hg, .svn, .bzr, _darcs)
" 'a' like 'c'  仅在CtrlP之外的当前目录不是当前文件目录的直接上级时才适用
" 0 or '' 禁用这些特点
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'

let g:ctrlp_max_height = 20

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

