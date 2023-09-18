! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: kernel strings ;
IN: classy

TUPLE: movie title director actors ;
: <movie> ( title director actors -- movie ) movie boa ;

GENERIC: star ( item -- star )
TUPLE: band
    { keyboards string read-only }
    { guitar string read-only }
    { bass string read-only }
    { drums string read-only } ;
: <band> ( keyboards guitar bass drums -- band ) band boa ;