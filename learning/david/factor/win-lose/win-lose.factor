! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel sequences math ;
IN: win-lose
: loss? ( score -- boolean ) [ first ] keep third < [ t ] [ f ] if ;
: tie? ( score -- boolean ) [ first ] keep third = [ t ] [ f ] if ;
: win? ( score -- boolean ) [ first ] keep third > [ t ] [ f ] if ;
! : game-points ( st -- points ) ;
! : points ( seq -- n ) ;