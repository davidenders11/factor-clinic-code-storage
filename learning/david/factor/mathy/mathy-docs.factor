! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax kernel math ;
IN: mathy

HELP: [2..b]
{ $values
    { "n" integer }
    { "{2,...,n}" object }
}
{ $description "" } ;

HELP: fact
{ $values
    { "n" integer }
}
{ $description "" } ;

HELP: multiple?
{ $values
    { "a" object } { "b" object }
    { "?" boolean }
}
{ $description "" } ;

HELP: prime?
{ $values
    { "n" fixnum }
    { "?" boolean }
}
{ $description "Tests if n is prime. n is assumed to be a positive integer" } ;

HELP: prod
{ $values
    { "{x1,...,xn}" object }
    { "x1*...*xn" object }
}
{ $description "" } ;

ARTICLE: "mathy" "mathy"
{ $vocab-link "mathy" }
;

ABOUT: "mathy"
