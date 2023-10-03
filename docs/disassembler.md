# Disassembling in Factor

- Install the [capstone framework](https://formulae.brew.sh/formula/capstone) with `brew install capstone`
- Load the library: `USE: tools.disassembler.capstone`
- Rebuild Factor (`./build.sh update` if on `x86` architecture or `arch -x86_64 ./build.sh update` on ARM machine)
- Define a word `: hello ( -- ) "hello" print ;`
- Disassemble it `\ hello disassemble`
