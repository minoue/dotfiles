syntax keyword zbrushCommand VarDef
syntax keyword zbrushCommand VarSet
syntax keyword zbrushCommand Note
syntax keyword zbrushCommand Exit

syntax keyword zbrushRepeat Loop 

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
