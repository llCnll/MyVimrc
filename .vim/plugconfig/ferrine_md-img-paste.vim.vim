autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" 默认当前目录
let g:mdip_imgdir = '.'
" let g:mdip_imgname = 'image'
