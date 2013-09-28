if exists("autoloaded_adjustscroll") || &cp
  finish
endif
let autoloaded_adjustscroll = '0.1'

" adjustscroll#reset(): Choose a nice horizontal and vertical scroll position {{{2
fun! adjustscroll#reset()
  normal! zt
  let scroll = (winheight(0)-&scrolloff*2-1)/3
  if scroll>0
    exe 'normal! '.scroll."\<C-Y>"
  endif

  " Show as much of the code as possible near the end of the document
  if line('$') == line('w$')
    normal! zb
    while line('$') != line('w$')
      exe "normal! \<C-E>"
    endwhile
  endif

  " Scroll the text horizontally to position the cursor at the right side of the screen.
  normal! ze
endf

" adjustscroll#check(command): Runs the specified command and updates viewport {{{2
fun! adjustscroll#check(command)
  if len(a:command) == 0
    return adjustscroll#reset()
  endif

  let [buf, start, end] = [bufnr(''), line('w0'), line('w$')]
  sil exe a:command
  if bufnr('') != buf || (line('w0') > end || line('w$') < start)
    call adjustscroll#reset()
  endif
endf

fun! adjustscroll#remap_normal(command)
  " Insert <C-u> et al literally into the map
  let z = substitute(a:command, '\v\<.[\+-].\>', '<C-v>\0', 'g')
  exe 'nnoremap <silent> '.a:command.' :<C-u>call adjustscroll#check("normal! ".(v:count>0?v:count : "")."'.z.'")<cr>'
endf
