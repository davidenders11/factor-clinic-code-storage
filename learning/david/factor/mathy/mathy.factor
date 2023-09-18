! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: math math.functions sequences ranges kernel ;
IN: mathy

: prod ( {x1,...,xn} -- x1*...*xn ) 1 [ * ] reduce ;
: fact ( n -- n ) [1..b] prod ;

: [2..b] ( n -- {2,...,n} ) 2 swap [a..b] ; inline
: multiple? ( a b -- ? ) swap divisor? ; inline
: prime? ( n -- ? )
    [ sqrt [2..b] ] [ [ multiple? ] curry ] bi any? not ;