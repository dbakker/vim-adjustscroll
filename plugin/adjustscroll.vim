if exists("loaded_adjustscroll") || &cp
  finish
endif
let loaded_adjustscroll = '0.1'

com! -nargs=* AdjustScroll call adjustscroll#check(<q-args>)

if !exists('g:adjustscroll_auto') || g:adjustscroll_auto == 1
  aug AutoAdjustScroll
    au!
    au VimResized * AdjustScroll
    au BufWinEnter * AdjustScroll
  aug END
endif

if !exists('g:adjustscroll_remap') || g:adjustscroll_remap == 1
  for i in split('`. gg G zr zm <C-O> <C-W>o <C-U> <C-D> <C-6> * # n N <C-]> gd')
    if len(maparg(i, 'n')) == 0
      call adjustscroll#remap_normal(i)
    endif
  endfor
  nnoremap <silent> <PageDown> <PageDown>:AdjustScroll<cr>
  nnoremap <silent> <PageUp> <PageUp>:AdjustScroll<cr>
  nnoremap <silent> <C-I> <C-I>:AdjustScroll<cr>
endif
