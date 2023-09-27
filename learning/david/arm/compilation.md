# Useful Commands

- `clang++ -S vectornorm.cpp` to compile to assembly code
  - use optimization flag `-O0` or `-O1`
  - add debugging symbols flag `-g` for a TON more info
- `as vectornorm.s -o vectornorm.o` to assemble to object code
- `` ld vectornorm.o -o vectornorm -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 `` to link and generate executable
