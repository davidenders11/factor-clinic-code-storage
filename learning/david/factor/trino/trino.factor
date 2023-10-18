! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel math ;
IN: trino

: sqd ( x -- x ) dup * ;
: trino ( c b a x -- a*x*x+b*x+c ) [ sqd ] keep swap swapd * -rot * + + ; 