! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: ;
IN: arm-add

USING: alien alien.c-types cpu.arm.64.assembler
       cpu.arm.64.assembler.opcodes system ;

HOOK: addr-test cpu ( -- n )

M: arm.64 addr-test
    longlong { } cdecl [
        X0 X1 X0 ADDr
        X0 RET
    ] alien-assembly ;

: test-addr ( -- x )
    addr-test ;
