! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel sequences unicode ;
IN: palindrome

: normalize ( string -- string' ) [ Letter? ] filter >lower ;
: palindrome? ( string -- ? ) normalize dup reverse = ;
