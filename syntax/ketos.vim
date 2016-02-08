" Vim syntax file
" Language:    Ketos
" Maintainer:  Murarth <murarth@gmail.com>
" Last Change: December 27, 2015
" URL:         https://github.com/murarth/ketos

" For vim-version 5.x: Clear all syntax items
" For vim-version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match ketosAtom "'\k\+\>"

syn keyword ketosBool true false

syn match ketosChar "#'\([^']\|\\\(x[0-7][0-9a-fA-F]\|u{[0-9a-fA-F]*}\)\)'"

syn keyword ketosFunc * + - .  .= / // /= < << <= = > >= >> ^ abs
syn keyword ketosFunc append ceil chars concat denom elt first float floor
syn keyword ketosFunc format fract id inf init int is is-instance join last len
syn keyword ketosFunc list max min nan new not null numer panic print println
syn keyword ketosFunc rat recip rem reverse round second slice string tail
syn keyword ketosFunc trunc type-of xor zero

syn keyword ketosOperator and apply case cond define do export if lambda let
syn keyword ketosOperator macro or struct use

syn match ketosKey ":\k\+\>"

syn match ketosBinNumber "\<0b[_01]\+"
syn match ketosOctNumber "\<0o[_0-7]\+"
syn match ketosHexNumber "\<0x[_0-9a-fA-F]\+"
syn match ketosNumber "\<-\?[_0-9]\+\(/[_0-9]\+\|\(\.[_0-9]*\)\?\([eE]-\?[_0-9]\+\)\?\)\?"

syn region ketosRawString start=+r\z(#*\)"+ end=+"\z1+
syn region ketosString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=ketosStringEscape
syn match ketosStringEscape "\\\(x[0-9a-fA-F]{2}\+\|u{[0-9a-fA-F]*}\)" contained

syn region ketosCommentBlock    start="#|" end="|#" contains=ketosTodo,ketosCommentBlock,ketosCommentLine
syn region ketosCommentLine     start=";"  end="$"  contains=ketosTodo
syn region ketosDocCommentLine  start=";;" end="$"  contains=ketosTodo

syn keyword ketosTodo contained TODO FIXME XXX NB NOTE

syn region ketosList matchgroup=Delimiter start="(" end=")" transparent fold
syn region ketosQList matchgroup=PreProc start="`(" end=")" transparent fold

hi! def link ketosBinNumber ketosNumber
hi! def link ketosOctNumber ketosNumber
hi! def link ketosHexNumber ketosNumber
hi! def link ketosRatio ketosNumber

hi! def link ketosAtom Special
hi! def link ketosBool Boolean
hi! def link ketosChar Character
hi! def link ketosCommentBlock Comment
hi! def link ketosCommentLine Comment
hi! def link ketosDocCommentLine SpecialComment
hi! def link ketosFunc Keyword
hi! def link ketosKey Keyword
hi! def link ketosNumber Number
hi! def link ketosOperator Keyword
hi! def link ketosString String
hi! def link ketosStringEscape Special
hi! def link ketosTodo Todo

let b:current_syntax = 'ketos'
