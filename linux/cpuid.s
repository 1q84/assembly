#as -o cpuid.o cpuid.s
#ld -o cpuid cpuid.o
#./cpuid
#The processor Vendor ID is 'GenuineIntel'

.section .data
output:
    .ascii "The processor Vendor ID is 'xxxxxxxxxxxx'\n"   
.section .text
.globl _start
_start:
    movl $0, %eax
    cpuid  
    movl $output, %edi
    movl %ebx, 28(%edi)
    movl %edx, 32(%edi)
    movl %ecx, 36(%edi)
    movl $4, %eax
    movl $1, %ebx
    movl $output, %ecx
    movl $42, %edx
    int $0x80
    movl $1, %eax
    movl $0, %ebx
    int $0x80
