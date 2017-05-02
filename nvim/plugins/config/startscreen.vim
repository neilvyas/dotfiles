autocmd User Startified setlocal colorcolumn=0 cul

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
" Have a nice 'vim' logo on startup :)
let g:startify_custom_header = s:filter_header([
            \ "                         o8o                   ",
            \ "                         `\"'                   ",
            \ "ooo. .oo.   oooo    ooo oooo  ooo. .oo.  .oo.  ",
            \ "`888P\"Y88b   `88.  .8'  `888  `888P\"Y88bP\"Y88b ",
            \ " 888   888    `88..8'    888   888   888   888 ",
            \ " 888   888     `888'     888   888   888   888 ",
            \ "o888o o888o     `8'     o888o o888o o888o o888o",
        \ ])
