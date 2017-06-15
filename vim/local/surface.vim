set columns=88            " set window width
set lines=66              " set window height
set guifont=Consolas\ for\ Powerline\ FixedD:h12
set guifont+=SimHei:h13:cANSI

let g:saveSpaceToggle=0

nmap <F12>s :call OpenWeeklyNotes()<CR>
function OpenWeeklyNotes()
    vs week_notes.txt
    set guifont=Consolas\ for\ Powerline\ FixedD:h11
    set guioptions-=l
    set guioptions-=r
    set guioptions-=L
    set guioptions-=R
    windo set nu!
    execute "normal \<C-w>=\<C-w>r"
    let g:saveSpaceToggle=1
endfunction
