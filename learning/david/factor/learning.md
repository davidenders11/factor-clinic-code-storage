# Learning

- Spaces matter! "[1..b]" returns an error (with no explanation), while " [1..b]" places a more useful result on the stack: `T{ range f 1 3628800 1 }`
- If we want to pass in an already defined word without executing it immediately, we use the **quotation** syntax which creates an anonymous function which can be shuffled around, manipulated and called.
- A **stack effect** is a method for documenting inputs to and outputs from the stack for a word being defined: e.g. the piece `( n -- n ! )` in `: fact ( n -- n! ) [1..b] 1 [ * ] reduce ;`. This is sort of like a mix between type-checking and documentation
- Use `bi` for applying two different quotations to the same argument (to avoid having to duplicate and swap and apply twice)
- `curry` can be used to partially apply words to arguments
- Create classes with `TUPLE: movie title director actors ;` and initialize with: `"The prestige" "Christopher Nolan"
{ "Hugh Jackman" "Christian Bale" "Scarlett Johansson" }
movie boa`, where `boa` means "by order of arguments" and is a simple way to initialize instance variables wihout specifying which is which
- [Combinators](https://docs.factorcode.org/content/vocab-combinators.html) can help to avoid stack shuffling
- DevFlow:
  - Can type `"palindrome" edit` and VSCode will open and edit that vocabulary or `\ palindrome? edit` to edit a specific word
  - Create a new project: `"project-name" scaffold-work`
  - Create testing file for project: `"project-name" scaffold-tests`
  - Create docs for project: `"project-name" scaffold-docs`
  - Hit `ctrl+t` instead of `enter` in the Listener to time a function's execution (or use the `time` word in your code)
  - `ctrl+p` goes back a command, `ctrl+n` goes forward one
  - Use the `lint` vocab (`"vocab-to-lint" lint-vocab`) to lint something
  - Use `\ some-word see` to look at the definition for some word you want to examine
  -

# Links

[Stack Shuffling](https://docs.factorcode.org/content/article-tour-stack-shuffling.html)

# Notes for Changes to Factor Docs

- [Typo "at the beginning"](https://docs.factorcode.org/content/article-tour-objects.html)
