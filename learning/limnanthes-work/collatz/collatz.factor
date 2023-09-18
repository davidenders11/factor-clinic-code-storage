! Copyright (C) 2023 Limnanthes Serafini
! See https://factorcode.org/license.txt for BSD license.
USING: kernel math ;
IN: collatz

: cstep ( integer -- integer ) dup even? [ 2 / ] [ 3 * 1 + ] if ;
: collatz ( integer -- integer ) dup 1 = [ drop 0 ] [ cstep collatz 1 + ] if ;