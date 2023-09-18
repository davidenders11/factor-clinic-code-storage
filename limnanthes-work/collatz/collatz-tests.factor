! Copyright (C) 2023 Limnanthes Serafini
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test collatz ;
IN: collatz.tests

{ 0 }    [ 1 collatz ]            unit-test
{ 1 }    [ 2 collatz ]            unit-test
{ 19 }   [ 9 collatz ]            unit-test
{ 118 }  [ 97 collatz ]           unit-test
{ 1348 } [ 989345275647 collatz ] unit-test