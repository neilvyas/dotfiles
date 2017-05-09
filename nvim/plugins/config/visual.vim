colorscheme solarized


autocmd User Startified setlocal colorcolumn=0 cul

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header([
            \ "                         o8o                   ",
            \ "                         `\"'                   ",
            \ "ooo. .oo.   oooo    ooo oooo  ooo. .oo.  .oo.  ",
            \ "`888P\"Y88b   `88.  .8'  `888  `888P\"Y88bP\"Y88b ",
            \ " 888   888    `88..8'    888   888   888   888 ",
            \ " 888   888     `888'     888   888   888   888 ",
            \ "o888o o888o     `8'     o888o o888o o888o o888o",
        \ ])


set laststatus=2
set noshowmode


" TODO FIXME The component and component_visible_condition bits are incredibly
" stupid and can be replaced by a single component_function set, but I can't
" figure out the intracacies of VimL function composition right now. Or ever,
" probably.
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{!(index(["help", "startify", "netrw"],&filetype)>=0) && &readonly ? "RO":""}',
      \   'modified': '%{(index(["help", "startify", "netrw"],&filetype)>=0)?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(!(index(["help", "startify", "netrw"],&filetype)>=0) && &readonly)',
      \   'modified': '(!(index(["help", "startify", "netrw"],&filetype)>=0)&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }


let g:tmuxline_powerline_separators = 0
