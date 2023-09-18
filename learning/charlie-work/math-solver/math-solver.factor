! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: prettyprint kernel sets math sequences splitting ranges 
math.functions math.primes.factors math.statistics ;
IN: math-solver


! solving the arithmetic numbers rosetta code problem
! but without using tons of vocab words like the published sol'n 

: arith? ( x -- ? ) divisors mean integer? ;
: loop-arith-print ( x x -- x x ) dup arith? [ dup . swap 1 + swap ] when 1 + ;
: 100-arith-rec ( x x -- x x )
    loop-arith-print swap dup 100 = [ ] [ swap 100-arith-rec ] if ;
: 100-arith ( -- ) 0 1 100-arith-rec 2drop ;

: loop-arith-quiet ( x x -- x x ) dup arith? [ swap 1 + swap ] when 1 + ;
: 1000-arith-rec ( x x -- x x )
    loop-arith-quiet swap dup 1000 = [ swap dup 1 - . ] [ swap 1000-arith-rec ] if ;
: 1000-arith ( -- ) 0 1 1000-arith-rec 2drop ;

: m-arith-rec ( x x x -- x x x )
    loop-arith-quiet -rot 2dup = [ rot dup 1 - . ] [ rot m-arith-rec ] if ;
: m-arith ( x -- ) 0 1 m-arith-rec 3drop ;
