! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: prettyprint io math kernel sequences ;
IN: fizzbuzz

: fizzbuzz ( x -- )
    <iota> [ 
        1 + dup pprint bl
        dup 3 mod
        0 = [ "Fizz" write ] [ ] if
        dup 5 mod
        0 = [ "Buzz" write ] [ ] if
        nl drop
    ] each ;
