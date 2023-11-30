inoremap <silent><expr> <tab>   coc#pum#visible() ? coc#pum#next(1)  : "\<tab>"
inoremap <silent><expr> <s-tab> coc#pum#visible() ? coc#pum#prev(1)  : "\<c-h>"
inoremap <silent><expr> <cr>    coc#pum#visible() ? coc#pum#confirm(): "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
inoremap <silent><expr> <esc>   coc#pum#visible() ? coc#pum#cancel() : "\<esc>"

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> [g <plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <plug>(coc-diagnostic-next)

nnoremap <silent> gd <plug>(coc-definition)
nnoremap <silent> gi <plug>(coc-implementation)
nnoremap <silent> gr <plug>(coc-references)
nnoremap <silent> gy <plug>(coc-type-definition)

nnoremap <leader>rn <plug>(coc-rename)

autocmd CursorHold * silent call CocActionAsync("highlight")
