// https://lldb.llvm.org/use/map.html

// gcc -o sample simple-c-program.c
// lldb sample
// `b mult` sets a breakpoint at the mult function
// `register read --all` or equivalently `re r -a` prints all registers

// given ` frame #0: 0x0000000100003f80 sample`main `
// `disassemble -a 0x0000000100003f80` prints assembly for main function
// sample`main:
// ->  0x100003f80 <+0>:  pushq  %rbp
//     0x100003f81 <+1>:  movq   %rsp, %rbp
//     0x100003f84 <+4>:  subq   $0x10, %rsp
//     0x100003f88 <+8>:  movl   $0x0, -0x4(%rbp)
//     0x100003f8f <+15>: movl   %edi, -0x8(%rbp)
//     0x100003f92 <+18>: movq   %rsi, -0x10(%rbp)
//     0x100003f96 <+22>: movl   $0x3, %edi
//     0x100003f9b <+27>: movl   $0x6, %esi
//     0x100003fa0 <+32>: callq  0x100003f40               ; mult
//     0x100003fa5 <+37>: addq   $0x10, %rsp
//     0x100003fa9 <+41>: popq   %rbp
//     0x100003faa <+42>: retq 

// given ` frame #0: 0x0000000100003f40 sample`mult `
// `disassemble -a 0x0000000100003f40` prints assembly for mult function
// ->  0x100003f40 <+0>:  pushq  %rbp
//     0x100003f41 <+1>:  movq   %rsp, %rbp
//     0x100003f44 <+4>:  movl   %edi, -0x4(%rbp)
//     0x100003f47 <+7>:  movl   %esi, -0x8(%rbp)
//     0x100003f4a <+10>: movl   $0x0, -0xc(%rbp)
//     0x100003f51 <+17>: cmpl   $0x0, -0x8(%rbp)
//     0x100003f55 <+21>: jle    0x100003f72               ; <+50>
//     0x100003f5b <+27>: movl   -0x4(%rbp), %eax
//     0x100003f5e <+30>: addl   -0xc(%rbp), %eax
//     0x100003f61 <+33>: movl   %eax, -0xc(%rbp)
//     0x100003f64 <+36>: movl   -0x8(%rbp), %eax
//     0x100003f67 <+39>: subl   $0x1, %eax
//     0x100003f6a <+42>: movl   %eax, -0x8(%rbp)
//     0x100003f6d <+45>: jmp    0x100003f51               ; <+17>
//     0x100003f72 <+50>: movl   -0xc(%rbp), %eax
//     0x100003f75 <+53>: popq   %rbp
//     0x100003f76 <+54>: retq   
//     0x100003f77 <+55>: nopw   (%rax,%rax)
 


int mult(int a, int b)
{
    int result = 0;
    while (b > 0) {
        result += a;
        b -= 1;
    }
    return result;
}

int main(int argc, char *argv[])
{
    return mult(3, 6);
}
