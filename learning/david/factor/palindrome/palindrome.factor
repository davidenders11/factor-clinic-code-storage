! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: unicode sequences kernel ;
IN: palindrome

: normalize ( string -- string' ) [ Letter? ] filter >lower ;
: palindrome? ( string -- ? ) normalize dup reverse = ;