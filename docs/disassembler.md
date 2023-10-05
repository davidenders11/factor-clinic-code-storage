# Disassembling in Factor

- Install the [capstone framework](https://formulae.brew.sh/formula/capstone) with `brew install capstone`
- Rebuild Factor (`./build.sh update` if on `x86` architecture or `arch -x86_64 ./build.sh update` on ARM machine)
- Load the library: `USE: tools.disassembler.capstone`
- Define a word `: hello ( -- ) "hello" print ;`
- Disassemble it `\ hello disassemble`
  - If running on an `arm64` machine (assuming Factor doesn't have an `arm64` compiler yet), your `libcapstone.dylib` will likely be in `/opt/homebrew` instead of in `/usr/lib` where Factor expects it.
  - To fix this you must first [install](https://gist.github.com/progrium/b286cd8c82ce0825b2eb3b0b3a0720a0) the `x86_64` version of homebrew on your machine, and then `arch -x86_64 brew reinstall capstone` and rebuild Factor `arch -x86_64 ./build.sh update`
