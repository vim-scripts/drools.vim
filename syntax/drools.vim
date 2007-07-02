" Vim syntax file
" Language:     Drools
" Maintainer:   Alan Daniels
" URL:          http://www.alandaniels.com/drools.vim
" Last Change:  2007 Jul 1
" This shamelessly borrows from the 'java.vim' syntax file.

" Quit when a syntax file was already loaded.
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " Define it here so that included files can test for it.
  let main_syntax='drools'
endif

" Don't use standard HiLink,  since it won't work with included syntax files.
if version < 508
  command! -nargs=+ DroolsHiLink hi link <args>
else
  command! -nargs=+ DroolsHiLink hi def link <args>
endif

" Drools syntax definitions.
syn keyword droolsBoolean  true false

syn match   droolsSpecialChar  contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn match   droolsCharacter    "'[^']*'" contains=droolsSpecialChar
syn match   droolsCharacter    "'\\''"   contains=droolsSpecialChar
syn match   droolsCharacter    "'[^\\]'"

syn keyword droolsTodo     contained TODO FIXME XXX
syn region  droolsComment  start="/\*"  end="\*/" contains=droolsTodo
syn match   droolsComment  "#.*$"  contains=droolsTodo
syn match   droolsComment  "//.*$" contains=droolsTodo

syn keyword droolsConditional  if else switch
syn keyword droolsConditional  and excludes exists or not matches
syn match   droolsConditional  "\<contains\>"

syn keyword droolsConstant  null

syn keyword droolsExternal  native package
syn match   droolsExternal  "\<import\>\(\s\+static\>\)\?"

syn keyword droolsKeyword  assert duration end eval function modify query salience
syn keyword droolsKeyword  retract return rule then when
syn match   droolsKeyword  "\<activation-group\>"
syn match   droolsKeyword  "\<agenda-group\>"
syn match   droolsKeyword  "\<auto-focus\>"
syn match   droolsKeyword  "\<no-loop\>"

syn match   droolsNumber  "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   droolsNumber  "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   droolsNumber  "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   droolsNumber  "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn keyword droolsOperator  new instanceof
syn match   droolsOperator  "->"

syn keyword droolsRepeat while for do

syn match   droolsSpaceError  "\\\s\+$"

syn region  droolsString  start=+"+ end=+"+ end=+$+ contains=droolsSpecialChar

syn keyword droolsType  boolean char byte short int long float double void


" All done! Kick in the highlighting.
if !exists("did_drools_syntax_inits")
   let did_drools_syntax_inits = 1

   DroolsHiLink droolsAssert       Assert
   DroolsHiLink droolsBoolean      Boolean
   DroolsHiLink droolsCharacter    Character
   DroolsHiLink droolsComment      Comment
   DroolsHiLink droolsConditional  Conditional
   DroolsHiLink droolsConstant     Constant
   DroolsHiLink droolsExternal     Include
   DroolsHiLink droolsKeyword      Keyword
   DroolsHiLink droolsNumber       Number
   DroolsHiLink droolsOperator     Operator
   DroolsHiLink droolsRepeat       Repeat
   DroolsHiLink droolsSpaceError   Error
   DroolsHiLink droolsSpecialChar  SpecialChar
   DroolsHiLink droolsString       String
   DroolsHiLink droolsTodo         Todo
   DroolsHiLink droolsType         Type
endif

delcommand DroolsHiLink

let b:current_syntax = "drools"

" vim: ts=8
