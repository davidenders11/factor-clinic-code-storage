# factor-clinic-code-storage

Storing code for intermediary work done for the 2023-2024 Factor clinic team

# Team Members:

Limnanthes Serafini\
Eli Pregerson\
Charlie Weismann\
Kanalu Monaco\
David Enders\
Advisor: Prof. Chris Stone\
Liaison: John Benediktsson

# Terminal Commands:

- Build Factor on ARM64: `arch -x86_64 ./build.sh update`
- Convert assembly code to object code: `as hello.s -o hello.o`
- Create ARM64 executable from object code: `` ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64 ``

# Useful links:

[ARM Simulator](http://163.238.35.161/~zhangs/arm64simulator/)

[Pretty Good ARM Hello World Tutorial](https://www.youtube.com/watch?v=d0OXp0zqIo0)

[GDB to LLDB command mapping](https://lldb.llvm.org/use/map.html)

[Factor FAQ](https://concatenative.org/wiki/view/Factor/FAQ)

["Learning Factor" (a bunch of good resources for Factor learning)](https://useless-factor.blogspot.com/2008/01/learning-factor.html)

[Stack Shufflers and more Tutorial](https://elasticdog.com/2008/12/beginning-factor-shufflers-and-combinators/)

# Important File Locations

- [`factor/factor-unmaintained/cpu/arm/architecture`](https://github.com/factor/factor-unmaintained/tree/main/cpu/arm/architecture) (links to unmaintained part of the ARM32 compiler where ARM32 words are defined in Factor)
- [`factor/factor/basis/CPU/arm/32/assembler`](https://github.com/factor/factor/tree/master/basis/cpu/arm/32/assembler) (links to assembler that turns Factor ARM into real ARM)
