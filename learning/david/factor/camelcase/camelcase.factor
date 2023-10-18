! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: io kernel sequences unicode splitting lists arrays ;
IN: camelcase
: to-camel-case ( str -- str ) dup empty? [  ] [ dup first swap "-_" split [ capitalize ] map "" join 0 swap [ set-nth ] keep ] if ;