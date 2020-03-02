" Trygve Woldseth
" Brukt guide > https://dougblack.io/words/a-good-vimrc.html


"###############################
"   Farger 
"###############################
syntax enable



"###############################
"   Tab og space
"###############################
set tabstop=4           " Antall visuelle space for hver tab
set softtabstop=4       " Antall space som en tab blir byttet ut med
set expandtab           " Tab blir til space

"###############################
"   UI
"###############################
set number              " Vis linje nummer
set relativenumber      " viser det relative linjenummeret
set showcmd             " Vis siste command i nedre jørne
set cursorline          " Highlight current line
filetype indent on      " Laster inn filtype spesifikke indent ie. .vim/indent/python.vim blir lastet når en *.py fil blir åpnet
set wildmenu            " Visuel autocomplete for command menyen
set lazyredraw          " Tegn kunn sjermen på nytt når det trengs (ikke midt i macros ol)
set showmatch           " Marker matchende ({[]})

"###############################
"   Søk
"###############################
set incsearch           " Søk fortøpende mens karekterer blir lakt till
set hlsearch            " Highlight matcer i søk

" binner avmarkering fra søk til space
"nnoremap <leader><space> :nohlsearch<CR>  

"   Folding
" Når man kan 'klappe' sammen en fungsjon og ikke se den
" Tenke ikke æ har så super mye bruk for det egentlig


"###############################
"   Movement
"###############################
" beveger seg over visuelle linjer ikke vanlige

" Rebinner gå til start ^ og slutt $ av linje til B(ginning) og E(nd)
nnoremap B ^
nnoremap E $

" når nye tastaturet kommer med alle dem rara key bindingene så mule jeg skal koble opp så jeg kan bruke hjkl for bevegelse 


"###############################
" Editing 
"###############################

nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

imap <A-j> <Esc>mz:m+<cr>`zi
imap <A-k> <Esc>mz:m-2<cr>`zi


"###############################
" Leader Shortcuts
"###############################

let mapleader="," 

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set ttimeout ttimeoutlen=50


    
    
