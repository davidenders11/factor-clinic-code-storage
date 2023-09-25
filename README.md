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

[Chromium System Call Table](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md)

[Apple System Calls](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master)

[Pretty Good ARM Hello World Tutorial](https://www.youtube.com/watch?v=d0OXp0zqIo0)

[GDB to LLDB command mapping](https://lldb.llvm.org/use/map.html)
