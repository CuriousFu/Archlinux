let s:tree_up_dir_line = '.. (up a dir)'
syn match NERDTreeIgnore #\~#
exec 'syn match NERDTreeIgnore #\['.g:NERDTreeGlyphReadOnly.'\]#'

"highlighting for the .. (up dir) line at the top of the tree
execute "syn match NERDTreeUp #\\V". s:tree_up_dir_line ."#"

"quickhelp syntax elements
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*:#ms=s+2,me=e-1
syn match NERDTreeHelpKey #" \{1,2\}[^ ]*,#ms=s+2,me=e-1
syn match NERDTreeHelpTitle #" .*\~#ms=s+2,me=e-1
syn match NERDTreeToggleOn #(on)#ms=s+1,he=e-1
syn match NERDTreeToggleOff #(off)#ms=e-3,me=e-1
syn match NERDTreeHelpCommand #" :.\{-}\>#hs=s+3
syn match NERDTreeHelp  #^".*# contains=NERDTreeHelpKey,NERDTreeHelpTitle,NERDTreeIgnore,NERDTreeToggleOff,NERDTreeToggleOn,NERDTreeHelpCommand

"highlighting for sym links
syn match NERDTreeLinkTarget #->.*# containedin=NERDTreeDir,NERDTreeFile
syn match NERDTreeLinkFile #.* ->#me=e-3 containedin=NERDTreeFile
syn match NERDTreeLinkDir #.*/ ->#me=e-3 containedin=NERDTreeDir

"highlighing for directory nodes and file nodes
syn match NERDTreeDirSlash #/# containedin=NERDTreeDir

exec 'syn match NERDTreeClosable #'.escape(g:NERDTreeDirArrowCollapsible, '~').'# containedin=NERDTreeDir,NERDTreeFile'
exec 'syn match NERDTreeOpenable #'.escape(g:NERDTreeDirArrowExpandable, '~').'# containedin=NERDTreeDir,NERDTreeFile'

let s:dirArrows = escape(g:NERDTreeDirArrowCollapsible, '~]\-').escape(g:NERDTreeDirArrowExpandable, '~]\-')
exec 'syn match NERDTreeDir #[^'.s:dirArrows.' ].*/#'
syn match NERDTreeExecFile  #^ .*\*\($\| \)# contains=NERDTreeRO,NERDTreeBookmark
exec 'syn match NERDTreeFile  #^[^"\.'.s:dirArrows.'] *[^'.s:dirArrows.']*# contains=NERDTreeLink,NERDTreeRO,NERDTreeBookmark,NERDTreeExecFile'

"highlighting for readonly files
exec 'syn match NERDTreeRO # *\zs.*\ze \['.g:NERDTreeGlyphReadOnly.'\]# contains=NERDTreeIgnore,NERDTreeBookmark,NERDTreeFile'

syn match NERDTreeFlags #^ *\zs\[.\]# containedin=NERDTreeFile,NERDTreeExecFile
syn match NERDTreeFlags #\[.\]# containedin=NERDTreeDir

syn match NERDTreeCWD #^[</].*$#

"highlighting for bookmarks
syn match NERDTreeBookmark # {.*}#hs=s+1

"highlighting for the bookmarks table
syn match NERDTreeBookmarksLeader #^>#
syn match NERDTreeBookmarksHeader #^>-\+Bookmarks-\+$# contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmarkName #^>.\{-} #he=e-1 contains=NERDTreeBookmarksLeader
syn match NERDTreeBookmark #^>.*$# contains=NERDTreeBookmarksLeader,NERDTreeBookmarkName,NERDTreeBookmarksHeader

hi def link NERDTreePart Special
hi def link NERDTreePartFile Type
hi def link NERDTreeExecFile Title
hi def link NERDTreeDirSlash Identifier

hi def link NERDTreeBookmarksHeader statement
hi def link NERDTreeBookmarksLeader ignore
hi def link NERDTreeBookmarkName Identifier
hi def link NERDTreeBookmark normal

hi def link NERDTreeHelp String
hi def link NERDTreeHelpKey Identifier
hi def link NERDTreeHelpCommand Identifier
hi def link NERDTreeHelpTitle Macro
hi def link NERDTreeToggleOn Question
hi def link NERDTreeToggleOff WarningMsg

hi def link NERDTreeLinkTarget Type
hi def link NERDTreeLinkFile Macro
hi def link NERDTreeLinkDir Macro

hi def link NERDTreeDir Directory
hi def link NERDTreeUp Directory
hi def link NERDTreeFile Normal
hi def link NERDTreeCWD Statement
hi def link NERDTreeOpenable Directory
hi def link NERDTreeClosable Directory
hi def link NERDTreeIgnore ignore
hi def link NERDTreeRO WarningMsg
hi def link NERDTreeBookmark Statement
hi def link NERDTreeFlags Number

hi def link NERDTreeCurrentNode Search
" show some nice colors for different files

" Base16 GUI color definitions
let s:gui00 = "181818"  "black
let s:gui01 = "282828"  "darkgrey
let s:gui02 = "383838"  "darkgrey
let s:gui03 = "585858"  "grey
let s:gui04 = "b8b8b8"  "grey
let s:gui05 = "d8d8d8"  "grey
let s:gui06 = "e8e8e8"  "lightgrey
let s:gui07 = "f8f8f8"  "white
let s:gui08 = "ab4642"  "red
let s:gui09 = "dc9656"  "orange
let s:gui0A = "f7ca88"  "yellow
let s:gui0B = "a1b56c"  "green
let s:gui0C = "86c1b9"  "cyan
let s:gui0D = "7cafc2"  "blue
let s:gui0E = "ba8baf"  "magenta
let s:gui0F = "a16946"  "brown

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace ==? "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" built-in types
exec "highlight NERDTreeDir         ctermfg=". s:cterm0D ." ctermbg=NONE guifg=#". s:gui0D ." guibg=NONE"
exec "highlight NERDTreeOpenable    ctermfg=". s:cterm0D ." ctermbg=NONE guifg=#". s:gui0D ." guibg=NONE"
exec "highlight NERDTreeClosable    ctermfg=". s:cterm08 ." ctermbg=NONE guifg=#". s:gui08 ." guibg=NONE"

" custom file types
exec "highlight FileSourceJs        ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileSourcePhp       ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileSourcePython    ctermfg=". s:cterm0B ." ctermbg=NONE guifg=#". s:gui0B ." guibg=NONE"
exec "highlight FileMarkup          ctermfg=". s:cterm08 ." ctermbg=NONE guifg=#". s:gui08 ." guibg=NONE"
exec "highlight FileStyle           ctermfg=". s:cterm0C ." ctermbg=NONE guifg=#". s:gui0C ." guibg=NONE"
exec "highlight FileDocument        ctermfg=". s:cterm0A ." ctermbg=NONE guifg=#". s:gui0A ." guibg=NONE"
exec "highlight FileConfig          ctermfg=". s:cterm0E ." ctermbg=NONE guifg=#". s:gui0E ." guibg=NONE"
exec "highlight FileLogging         ctermfg=". s:cterm04 ." ctermbg=NONE guifg=#". s:gui04 ." guibg=NONE"
exec "highlight FileIgnore          ctermfg=". s:cterm03 ." ctermbg=NONE guifg=#". s:gui03 ." guibg=NONE"


syn match FileConfig          /^\s\+.*\.conf$/
syn match FileConfig          /^\s\+.*\.config$/
syn match FileConfig          /^\s\+.*\.ini$/
syn match FileConfig          /^\s\+.*\.json$/
syn match FileConfig          /^\s\+.*\.yaml$/
syn match FileConfig          /^\s\+.*\.yml$/

syn match FileDocument        /^\s\+.*\.md$/
syn match FileDocument        /^\s\+.*\.txt$/

syn match FileIgnore          /^\s\+.*\.bashrc$/
syn match FileIgnore          /^\s\+.*\.ds_store$/
syn match FileIgnore          /^\s\+.*\.gitconfig$/
syn match FileIgnore          /^\s\+.*\.gitignore$/
syn match FileIgnore          /^\s\+.*\.zsh$/

syn match FileLogging         /^\s\+.*\.log$/

syn match FileSourceJs        /^\s\+.*\.js$/
syn match FileSourcePhp       /^\s\+.*\.php$/
syn match FileSourcePython    /^\s\+.*\.py$/

syn match FileMarkup          /^\s\+.*\.html$/
syn match FileStyle /^\s\+.*\.css$/
