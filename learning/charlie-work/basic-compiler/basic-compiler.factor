USING: kernel io splitting sequences io.encodings.utf8 io.files io.directories 
prettyprint math.parser math ;
IN: basic-compiler

! ! Get the name of the text file from the user
! : get-input ( -- x ) "Enter the name of the text file: " print flush readln "work/basic-compiler/" swap append dup touch-file ;

! ! Open the text file and write line
! : open-file ( x -- ) 
!     "Enter text to write to the file (press Enter to finish): " print flush readln
!     [ . ] curry utf8 swap with-file-writer
!     ;



! Get the name of the text file from the user
: get-file-name ( -- x ) "Enter the name of the text file: " print flush readln "work/basic-compiler/" swap append dup touch-file ;

! 
: get-command ( -- x ) "Enter text to write to the file (press Enter to finish): " print flush readln ;

: parse-op ( x -- x )
    dup "+" = [ drop "add" ] [ ] if
    dup "-" = [ drop "sub" ] [ ] if
    dup "*" = [ drop "mul" ] [ ] if
    dup "/" = [ drop "div" ] [ ] if
    ;

: parse-num ( x x -- x x ) 
    "mov r3, #" swap append
    "\nstr r3, [fp, #" append swap dup -rot number>string
    append "]" append swap 4 - swap
    ;

: parse-input ( x -- x x x )
    " " split first3
    -8 swap parse-num
    -rot swap parse-num
    ! load var 1
    ! load var 2
    ! parse-op
    swap drop
    ;

! Open the text file and write line
: open-file ( x x -- )  [ . ] curry utf8 swap with-file-writer ;

: basic-compiler ( -- ) get-file-name get-command open-file ;
