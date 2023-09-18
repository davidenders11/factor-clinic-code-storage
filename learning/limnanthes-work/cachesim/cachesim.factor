! Copyright (C) 2023 Limnanthes Serafini.
! See https://factorcode.org/license.txt for BSD license.
USING: accessors kernel math math.functions arrays 
       bit-arrays sequences sequences.private slots
       prettyprint io io.files io.encodings.utf8 
       splitting math.parser formatting namespaces ;
IN: cachesim

SYMBOL: verbose
verbose [ f ] initialize 

TUPLE: pLRU numsets treelen treearray ;
TUPLE: cacheline tag valid dirty ;
TUPLE: cachesim numways numsets taglen setlen offsetlen ways pLRU ;

: // ( a b -- c ) / floor ;

! ?set-nth is value index array. 

: <pLRU> ( numways numsets -- pLRU ) 
    swap 1 - 2dup 0 [ <array> ] 2curry replicate pLRU boa ;

: 1way? ( pLRU -- pLRU ? ) 
    dup treelen>> 0 = ;

: update-parent ( child parent tree -- parent tree'  ) 
    [ 2 mod ] 2dip [ ?set-nth ] 2keep ;

: get-and-update-parent ( child tree -- child' tree' ) 
    [ dup 1 - 2 // ] dip update-parent ;

: update-loop ( child tree -- ) 
    [ over 0 > ] [ get-and-update-parent ] while 2drop ;

: calculate-leaf ( waynum tree -- value index ) 
    [ [ 1 + 2 mod ] [ 2 // ] bi ] [ length 1 - 2 // ] bi* + ;

: update-tree ( waynum tree -- ) 
    dup [ calculate-leaf ] dip [ ?set-nth ] 2keep update-loop ;

: update-pLRU ( waynum setnum pLRU -- ) 
    1way? [ 3drop ] [ treearray>> ?nth update-tree ] if ;

: descend-step ( tree b-row index -- tree b-row index ) 
    pick dupd ?nth 0 = [ 2 * 1 + ] [ 2 * 2 + ] if ;

: descend-post-proc ( tree b-row index -- waynum ) 
    pick dupd ?nth 1 = [ swap - 2 * ] dip [ 1 + ] when nip ;

: descend-tree ( tree -- waynum ) 
    dup length 2 // 0 [ 2dup > ] [ descend-step ] while descend-post-proc ;

: get-victim ( setnum pLRU -- waynum ) 
    1way? [ 2drop 0 ] [ treearray>> ?nth descend-tree ] if ;

: <cacheline> ( -- cacheline ) 
    0 f f cacheline boa ;

: make-ways ( numways numsets -- ways ) 
    swap [ [ <cacheline> ] replicate ] curry replicate ;

:: <cachesim> ( numways numsets addrlen taglen -- cachesim ) 
    numways numsets taglen over 2 logn >integer addrlen 
    2over + - numways numsets [ make-ways ] [ <pLRU> ] 2bi cachesim boa ;

: flush ( cachesim -- cachesim ) 
    [ ways>> [ [ f >>dirty drop ] each ] each ] keep ;

: invalidate ( cachesim -- cachesim ) 
    [ ways>> [ [ f >>valid drop ] each ] each ] keep ;

: clear-pLRU ( cachesim -- cachesim ) 
    dup [ numways>> ] [ numsets>> ] bi <pLRU> >>pLRU ;

: split-addr-helper ( addr offsetlen setlen -- offset set tag )  
    [ cut ] dip cut [ bit-array>integer ] tri@ ;

: split-addr ( cachesim addr -- cachesim offset set tag ) 
    integer>bit-array over [ offsetlen>> ] [ setlen>> ] bi split-addr-helper ;

: loop-check-pre-proc  ( cachesim      setnum tag          ways-for-set is-write? -- 
                          cachesim pLRU setnum tag success? is-write? ways-for-set )
    [ dup pLRU>> ] 4dip 
    over nipd f swap ;

:: check-for-hit-inner ( pLRU setnum tag is-write? success? cacheline waynum -- 
                         pLRU setnum tag is-write? success? ) 
     cacheline [ valid>> ] [ tag>> ] bi tag = and
        [ cacheline dup dirty>> is-write? or >>dirty drop
        waynum setnum pLRU update-pLRU
        pLRU setnum tag is-write? t ] 
        [ pLRU setnum tag is-write? success? ] if ;

: check-for-hit ( cachesim setnum tag ways-for-set is-write? -- 
                  cachesim setnum tag is-write? success? ) 
    loop-check-pre-proc
    [ check-for-hit-inner ] each-index 
    [ drop ] 4dip ;

:: check-for-miss-inner ( pLRU setnum tag is-write? success? cacheline waynum -- 
                          pLRU setnum tag is-write? success? )
    cacheline valid>> not success? not and 
    [ cacheline
        tag       >>tag
        t         >>valid
        is-write? >>dirty
    drop
    waynum setnum pLRU update-pLRU
    pLRU setnum tag is-write? t ]
    [ pLRU setnum tag is-write? success? ] if ;

: check-for-miss ( cachesim setnum tag ways-for-set is-write? -- 
                   cachesim setnum tag is-write? success? ) 
    loop-check-pre-proc
    [ check-for-miss-inner ] each-index 
    [ drop ] 4dip ;

:: do-eviction ( cachesim setnum tag is-write? -- cachesim result ) 
    cachesim pLRU>> :> pLRU
    setnum pLRU get-victim :> victim-way
    victim-way setnum cachesim ways>> ?nth ?nth
        dup dirty>> [ "D" ] [ "E" ] if :> result
        tag       >>tag
        t         >>valid
        is-write? >>dirty
    drop
    victim-way setnum pLRU update-pLRU
    cachesim result ;

: get-ways-for-set ( cachesim setnum tag is-write? -- 
                     cachesim setnum tag ways-for-set is-write? )
    [ over reach ways>> ?nth ] dip ;

: cache-access ( cachesim addr is-write? -- cachesim result ) 
    [ split-addr nipd ] dip get-ways-for-set check-for-hit [ 
            3drop "H"
        ] [
            get-ways-for-set check-for-miss [
                3drop "M"
            ] [
                do-eviction
            ] if
        ] if ;

: print-ways ( cachesim setnum -- cachesim )
    [ dup ways>> ] dip swap ?nth . ;


: simulate-non-addr-line ( cachesim line -- cachesim ) 
    0 swap ?nth dup 
    [ [ "BEGIN" = ] [ "TRAIN" = ] bi or [ invalidate clear-pLRU ] when ] [ drop ] if ;

: print-mismatch ( result line -- )
   swap [ [ 0 swap ?nth ] [ 2 swap ?nth ] bi ] dip
   "Result mismatch at address %s. Logfile: %s, Sim: %s\n" printf ;

: access-success ( result line verbose? -- )
    [ nip "Line %[%s, %] succeeded\n" printf ]
    [ 2drop ] if ;

: access-and-compare ( cachesim line -- cachesim )
    [ [ 0 swap ?nth hex> ] 
      [ 1 swap ?nth [ "W" = ] [ "A" = ] bi or ] bi 
      cache-access ] keep 
    2dup 2 swap ?nth = 
    [ verbose get access-success ]
    [ print-mismatch ] if ;

: simulate-addr-line ( cachesim line -- cachesim ) 
    dup 1 swap ?nth dup "F" = 
        [ 2drop flush ] 
        [ "I" = 
        [ drop invalidate ]
        [ access-and-compare ] if ] if ;

: simulate-inner-loop ( cachesim line -- cachesim ) 
    [ 32 = ] trim " " split 
    dup length 3 < 
        [ simulate-non-addr-line ]
        [ simulate-addr-line ] if ;

: simulate ( numways numsets addrlen taglen filename -- )
    [ <cachesim> ] dip utf8 [ [ simulate-inner-loop ] each-line ] with-file-reader drop ;

: example-addr ( -- addr ) 0x80011cac ;
: example-set ( -- setnum ) 50 ;
: example-cachesim ( -- cachesim ) 4 64 56 44 <cachesim> ; 
: example-logfile ( -- filename ) "work/cachesim/ICache.log" ;
: example-mini-logfile ( -- filename ) "work/cachesim/ICachemini.log" ;
: example-simulation ( -- ) 4 64 56 44 example-logfile simulate ;
: example-mini-simulation ( -- ) 4 64 56 44 example-mini-logfile simulate ;