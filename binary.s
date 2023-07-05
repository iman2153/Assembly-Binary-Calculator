.section .rodata
    .align 4
.tot:
    .long .A
    .long .B
    .long .C 
    .long .D
    .long .E 
    .long .F 
    .long .G 
    .long .H
    .long .I
    .long .J 
    .long .K
    .long .L
    .long .M
    .long .N
    .long .O
    .long .P
    .long .Q
    .long .R
    .long .S
    .long .T 
    .long .U
    .long .V
    .long .W
    .long .X
    .long .Y
    .long .Z
    .long .default
    .long .end

.data
    .equ LF,            10
    .equ NULL,          0
    .equ TRUE,          1
    .equ FALSE,         0
    .equ EXIT_SUCCESS,  0
    .equ STDIN,         0
    .equ STDOUT,        1
    .equ STDERR,        2
    .equ SYS_exit,      1
    .equ SYS_fork,      2
    .equ SYS_read,      3
    .equ SYS_write,     4
    .equ SYS_open,      5
    .equ SYS_close,     6
    .equ SYS_creat,     8
    .equ SYS_time,      13

var: 
    .long 90

ptwo:
    .long 1 

zero:
    .long 0
alpha:
    .long 33

newLine:
    .string "\n"                    # the .string pseudo-op creates a null terminated string.

help: 
    .string "Error"

.text
.globl main

main:
    pushl %ebp               # prologue
    movl  %esp, %ebp
    pushl %ebx
    movl $0, %edi


    # 12(%ebp) + 0 is a.out 
    # 12 (%ebp) +1 is option
    # 12 (%ebp) + 2 is operator
    # 12 (%ebp) +3 is arg 1
     # 12 (%ebp) +4 is arg 2

     # eax has the letter 
     # ebx is arg 1
     # edx is arg 2
    movl     $1, %ebx
    movl 12(%ebp), %esi
    movl (%esi,%ebx,4), %esi
    movl (%esi), %edi
    # bit mask  and shift to get second character
    shr $8, %edi
    and $255, %edi

    movl     $2, %ebx
    movl 12(%ebp), %esi
    movl (%esi,%ebx,4), %esi
    movl (%esi), %eax
    # bit mask to get first character
    and $255, %eax

    movl     $3, %ebx
    movl 12(%ebp), %esi
    movl (%esi,%ebx,4), %esi
    #movl (%esi), %ecx

    push %eax
    movl $0, %ebx
    call stringBtoD
    movl %eax, %ecx
    pop %eax

cont: 
    movl     $4, %ebx
    movl 12(%ebp), %esi
    movl (%esi,%ebx,4), %esi
   # movl (%esi), %edx


    push %eax
    push %ecx
    movl $0, %ebx
    call stringBtoD
    movl %eax, %edx
    pop %ecx
    pop %eax

    subl $65, %eax
    # herror lines
    cmp $26, %eax  # %eax - 26
    ja .default
    jmp *.tot(,%eax,4) 

.A:
    andl %edx, %ecx
    movl %ecx, %eax
    push %eax

    jmp .end
.D:
    subl %edx, %ecx
    movl %ecx, %eax
    push %eax
    jmp .end
.I:
    orl %edx, %ecx
    movl %ecx, %eax
    push %eax
    jmp .end
.L:
    //movb %edx, %cl
   // shl %edx, %ecx
    //movl %ecx, %eax
    push %eax
    jmp .end
.M:
    imull %edx, %ecx
    movl %ecx, %eax
    push %eax
    jmp .end
.N:
   // negl 
.O: 

.R:
    //sar %edx, %ecx
    jmp .end
.S:
    add %edx, %ecx
    movl %ecx, %eax
    push %eax
    jmp .end
.T:

.X:
    xorl %edx, %ecx
    movl %ecx, %eax
    push %eax
    jmp .end

.default:
    push help
    jmp .end

.B:
.C:
.E:
.F:
.G:
.H:
.J:
.K:
.P:
.Q:
.U:
.V:
.W:
.Y:
.Z:

    push help
    jmp .end

dtoStringD:
    push %edx
    push %eax
    push %ecx
    movl %esp, %ebx


    movl $0, %ecx
    push %ecx

    movl $10, %ecx
loop:
    movl $0, %edx
    idiv %ecx
    mov %edx, %edi
    addl $'0', %edi
    push %edi
    cmp $0, %eax
    je end
    jmp loop

end: 

    movl %esp, %esi


    call printString2


    movl %ebx, %esp
    pop %ecx
    pop %eax
    pop %edx
    ret