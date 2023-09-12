! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: prettyprint math kernel ;
IN: number-guesser

! : normalize ( string -- string' ) [ Letter? ] filter >lower ;
! : palindrome? ( string -- ? ) normalize dup reverse = ;

: guess-lower ( x y -- x' y' ) over - swap ;
: guess-higher ( x y -- x' y' ) + ;

: number-guesser ( x -- ) . ;

! MAIN: number-guesser