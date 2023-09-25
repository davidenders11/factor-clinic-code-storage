# Useful Commands

- `clang++ -S vectornorm.cpp` to compile to assembly code
- `as vectornorm.s -o vectornorm.o` to assemble to object code
- `` ld vectornorm.o -o vectornorm -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 `` to link and generate executable
