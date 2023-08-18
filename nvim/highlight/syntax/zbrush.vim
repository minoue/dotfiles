syntax keyword zbrushCommand Var
syntax keyword zbrushCommand VarDef
syntax keyword zbrushCommand VarSet
syntax keyword zbrushCommand VarInc

syntax keyword zbrushCommand IPress
syntax keyword zbrushCommand IButton
syntax keyword zbrushCommand ISubPalette
syntax keyword zbrushCommand IGetTitle

syntax keyword zbrushCommand RoutineDef
syntax keyword zbrushCommand RoutineCall

syntax keyword zbrushCommand StrMerge
syntax keyword zbrushCommand StrLength
syntax keyword zbrushCommand StrExtract

syntax keyword zbrushCommand FileExists
syntax keyword zbrushCommand FileExecute
syntax keyword zbrushCommand FileNameSetNext
syntax keyword zbrushCommand Mesh3DGet

syntax keyword zbrushCommand SubToolSelect
syntax keyword zbrushCommand SubToolGetCount
syntax keyword zbrushCommand SubToolGetStatus

syntax keyword zbrushCommand MemCreate
syntax keyword zbrushCommand MemDelete
syntax keyword zbrushCommand MemGetSize
syntax keyword zbrushCommand MemReadString
syntax keyword zbrushCommand MemWriteString

syntax keyword zbrushCommand Note
syntax keyword zbrushCommand Exit

syntax keyword zbrushRepeat Loop 
syntax keyword zbrushRepeat LoopExit

syntax match zbrushComment '//.*$'
syntax region zbrushString start=+"+ end=+"+

syntax match   zbrushNumberError '\<\d\+\D[lL]\=\>' display
syntax match   zbrushNumber      '\<\d[lL]\=\>' display
syntax match   zbrushNumber      '\<[0-9]\d\+[lL]\=\>' display
syntax match   zbrushNumber      '\<\d\+[lLjJ]\>' display
syntax match   zbrushFloat       '\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>' display
syntax match   zbrushFloat       '\<\d\+[eE][+-]\=\d\+[jJ]\=\>' display
syntax match   zbrushFloat       '\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=' display

highlight link zbrushCommand Function
highlight link zbrushComment Comment
highlight link zbrushNumber Number
highlight link zbrushFloat Number
highlight link zbrushNumberError Error
highlight link zbrushRepeat Repeat
highlight link zbrushString String
