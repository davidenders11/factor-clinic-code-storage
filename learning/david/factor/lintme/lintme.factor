! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel sequences splitting ;
IN: lintme

: startswith? ( str sub -- ? ) dup length swapd head = ;
