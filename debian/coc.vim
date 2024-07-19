function HeaderSource()
    let l:path = CocRequest("clangd", "textDocument/switchSourceHeader", { "uri": "file://" .. expand("%:p") })
    if l:path != "v:null"
        exec "edit " .. substitute(l:path, "^file://", "", "")
    endif
endfunction

function ShowDoc()
    if CocAction("hasProvider", "hover")
        call CocActionAsync("doHover")
    else
        call feedkeys("K", "in")
    endif
endfunction

inoremap <silent><expr> <tab>   coc#pum#visible() ? coc#pum#next(1)  : "\<tab>"
inoremap <silent><expr> <s-tab> coc#pum#visible() ? coc#pum#prev(1)  : "\<c-h>"
inoremap <silent><expr> <cr>    coc#pum#visible() ? coc#pum#confirm(): "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
inoremap <silent><expr> <esc>   coc#pum#visible() ? coc#pum#cancel() : "\<esc>"

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> <c-s> <plug>(coc-range-select)
vnoremap <silent> <c-s> <plug>(coc-range-select)

nnoremap <leader>as <plug>(coc-codeaction-cursor)
vnoremap <leader>as <plug>(coc-codeaction-selected)
nnoremap <leader>af <plug>(coc-fix-current)

nnoremap [g <plug>(coc-diagnostic-prev)
nnoremap ]g <plug>(coc-diagnostic-next)

nnoremap K  :call ShowDoc()<cr>

nnoremap gd <plug>(coc-definition)
nnoremap gh :call HeaderSource()<cr>
nnoremap gi <plug>(coc-implementation)
nnoremap gr <plug>(coc-references)
nnoremap gy <plug>(coc-type-definition)

nnoremap <leader>re <plug>(coc-codeaction-refactor)
vnoremap <leader>re <plug>(coc-codeaction-refactor-selected)
nnoremap <leader>rn <plug>(coc-rename)

nnoremap <silent> <leader>so :<c-u>CocList outline<cr>
nnoremap <silent> <leader>ss :<c-u>CocList symbols<cr>

autocmd CursorHold * silent call CocActionAsync("highlight")
