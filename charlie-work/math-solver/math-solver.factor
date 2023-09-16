! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: prettyprint kernel sets math sequences splitting ;
IN: math-solver

: num? ( char -- bool ) dup 48 >= swap 57 <= and ;
: op? ( char -- bool ) { 43 45 42 47 } in? ;

: gettype ( x x -- )
    num? [ ] [ ] if ;

: mathsolver ( x x -- x x )
    dup
    "+-*/" split .
    swap
    ;

: putonstack ( -- ) ;