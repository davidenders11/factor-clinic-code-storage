! loads primitives and creates a big quotation 
! that mainly loads important vocabularies
! and sets this quotation as the value for key OBJ-STARTUP-QUOT
! in some kind of special bootstrap object


! Copyright (C) 2004, 2009 Slava Pestov.
! See https://factorcode.org/license.txt for BSD license.
USING: assocs bootstrap.image.private hash-sets hashtables init
io io.files kernel kernel.private make memory namespaces parser
parser.notes sequences system vocabs vocabs.loader ;

"Bootstrap stage 1..." print flush

! load primitives
"resource:basis/bootstrap/primitives.factor" run-file

! do not load documentation when loading vocabularies
load-help? off

! A sequence of pathname strings to search for vocabularies.
{ "resource:core" } vocab-roots set

! Create a boot quotation for the target by collecting all top-level
! forms into a quotation, surrounded by some boilerplate.
[
    [
        ! Rehash hashtables first, since bootstrap.image creates
        ! them using the host image's hashing algorithms.
        [ hashtable? ] instances [ hashtables:rehash ] each
        [ hash-set? ] instances [ hash-sets:rehash ] each
        boot   ! Called on startup as part of the boot quotation to initialize the runtime and prepare it for running user code.
    ] %   ! Appends a sequence to the end of the sequence being constructed by make.

    ! require loads a vocabulary if it has not already been loaded.
    "math.integers" require
    "math.ratios" require
    "math.floats" require
    "memory" require

    "io.streams.c" require
    "io.streams.byte-array" require ! for utf16 on Windows
    "vocabs.loader" require

    "syntax" require

    "locals" require
    "locals.fry" require
    "locals.macros" require

    ! parses the file and outputs a quotation (appended to other quotations so far)
    "resource:basis/bootstrap/layouts.factor" parse-file %

    [
        ! stops the parser from printing various notes
        f parser-quiet? set-global

	! not exactly sure what this is, but it seems to be a special object similar to things created by the `boot` command
        init-resource-path

        ! run stage 2 of bootstrapping if the file exists 
        "resource:basis/bootstrap/stage2.factor"
        dup file-exists? [
            run-file
        ] [
            "Cannot find " write write "." print
            "Please move " write image-path write " into the same directory as the Factor sources," print
            "and try again." print
            1 (exit)
        ] if
    ] %
] [ ] make   ! puts all these quotations together into one quotation
OBJ-STARTUP-QUOT
bootstrap.image.private:special-objects get set-at

! presumably `bootstrap.image.private:special-objects get` returns an assoc
! sets this big quotation as the value for the key `OBJ-STARTUP-QUOT` in this assoc
