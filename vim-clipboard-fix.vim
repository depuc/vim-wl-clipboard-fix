" Yank to clipboard using wl-copy
vnoremap <leader>y :'<,'>w !wl-copy<CR><CR>

" Paste from clipboard using wl-paste
nnoremap <leader>p :r !wl-paste<CR>

" Optional: Automatically copy any yank to system clipboard
augroup AutoCopyWL
  autocmd!
  autocmd TextYankPost * silent! call system('wl-copy', getreg('"'))
augroup END

