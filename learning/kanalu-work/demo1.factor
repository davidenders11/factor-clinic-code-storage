! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: http.client text-to-speech sequences kernel json assocs unicode ;
IN: demo1

: pokedex_json ( x -- x )
    "https://pokeapi.co/api/v2/pokemon-species/" swap append
    http-get nip json> ;

: pokedex_get_entry_english ( x -- x )
    "flavor_text_entries" of 6 swap nth "flavor_text" of ;

: pokedex_get_english_genus ( x -- x )
    "genera" of 7 swap nth "genus" of ;

: pokedex_genus ( x -- )
    dup ", the " append swap
    pokedex_json pokedex_get_english_genus
    append speak-text ;

: pokedex ( x -- )
    dup dup ", the " append swap
    pokedex_json pokedex_get_english_genus
    ". " append
    append swap
    pokedex_json pokedex_get_entry_english
    append speak-text ;
