// 
// hello world 
//

.global _main
.align 2

// main
_main:
    b _printf   // branch to printf function
    // b _reboot    // uncomment and run with sudo to reboot
    b _terminate // branch to terminate function

_printf:
    mov X0, #1// stdout
    adr X1, #helloworld// address of hello world string
    mov X2, #12// length of string
    mov X16, #4// write to sdout
    svc 0// syscall

_reboot:
    mov x0, #1   // instant reboot
    mov x16, #55 // reboot
    svc 0        // call supervisor call

_terminate:
    mov x0, #0      // return 0
    mov x16, #1     // terminate
    svc 0           // call supervisor call

helloworld: .ascii "hello world\n"