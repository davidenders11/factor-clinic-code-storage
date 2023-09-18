! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test mathy math.functions ;
IN: mathy.tests

{ t } [ 9 3 divisor? ] unit-test
{ t } [ 3 9 multiple? ] unit-test
{ t } [ 43 prime? ] unit-test
{ f } [ 4 prime? ] unit-test