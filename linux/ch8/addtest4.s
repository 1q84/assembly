# addtest4.s - An example of detecting an overflow condition 
# as --32 -g -o addtest4.o addtest4.s
# ld -lc -dynamic-linker /lib/ld-linux.so.2 -melf_i386 -o addtest4 addtest4.o
.section .data
output:
    .asciz “The result is %d\n” .section .text
.globl _start
_start:
    movl $-1590876934, %ebx 
    movl $-1259230143, %eax 
    addl %eax, %ebx
    jo over
    pushl %ebx
    pushl $output 
    call printf 
    add $8, %esp 
    pushl $0
    call exit 
over:
    pushl $0 
    pushl $output
    call printf
    add $8, %esp 
    pushl $0
    call exit