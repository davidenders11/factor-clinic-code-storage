! Copyright (C) 2023 Limnanthes Serafini. 
! See https://factorcode.org/license.txt for BSD license.
USING: cachesim tools.test kernel accessors sequences ;
IN: cachesim.tests

{ } [ 4 16 16 8 <cachesim>
    0x1234 split-addr
    0x12 0x3 0x4 [ assert= ] tri@
    0x2638 split-addr
    0x26 0x3 0x8 [ assert= ] tri@
    0xA3E6 split-addr 
    0xA3 0xE 0x6 [ assert= ] tri@
    drop ] unit-test

: check-cache-access ( cachesim addr is-write? result -- cachesim )
    [ cache-access ] dip assert= ;

:: check-tag ( cachesim waynum setnum tag -- cachesim )
    cachesim dup ways>> [ waynum setnum ] dip ?nth ?nth tag>> tag assert= ;

:: check-pLRU ( cachesim setnum tree -- cachesim )
    cachesim dup pLRU>> treearray>> setnum swap ?nth tree assert= ;

{ } [ 4 16 16 8 <cachesim>
    ! insert way 0 set C tag AB
    0xABCD f "M" check-cache-access
    0x0 0xC 0xAB check-tag 
    0xABCD f "H" check-cache-access
    0xC { 1 1 0 } check-pLRU

    ! make way 0 set C dirty
    0xABCD t "H" check-cache-access

    ! insert way 1 set C tag AC 
    0xACCD f "M" check-cache-access
    0x1 0xC 0xAC check-tag
    0xC { 1 0 0 } check-pLRU

    ! insert way 2 set C tag AD
    0xADCD f "M" check-cache-access
    0x2 0xC 0xAD check-tag
    0xC { 0 0 1 } check-pLRU

    ! insert way 3 set C tag AE 
    0xAECD f "M" check-cache-access
    0x3 0xC 0xAE check-tag
    0xC { 0 0 0 } check-pLRU

    ! misc hit and pLRU checking
    0xABCD f "H" check-cache-access
    0xC { 1 1 0 } check-pLRU
    0xADCD f "H" check-cache-access
    0xC { 0 1 1 } check-pLRU

    ! evict way 1, now set C has tag AF
    0xAFCD f "E" check-cache-access
    0x1 0xC 0xAF check-tag
    0xC { 1 0 1 } check-pLRU

    ! evict way 3, now set C has tag AC
    0xACCD f "E" check-cache-access
    0x3 0xC 0xAC check-tag
    0xC { 0 0 0 } check-pLRU

    ! evict way 0, now set C has tag EA
    ! this line was dirty, so there was a wb
    0xEAC2 f "D" check-cache-access
    0x0 0xC 0xEA check-tag
    0xC { 1 1 0 } check-pLRU

    drop ] unit-test
