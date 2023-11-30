.data
    sir: .space 20
    formatScanf: .asciz "%s"
    formatPrintf: .asciz "%d\n"
.text

atoi:
    push %ebp
    movl %esp,%ebp
    push %edi
    push %ebx

    movl 8(%ebp),%edi
    xor %eax,%eax
    xor %ecx,%ecx

et_while:
    xor %ebx,%ebx
    movb (%edi,%ecx,1),%bl   # verificare sfarsit sir
    cmp %ebx,$0
    je exit_while

    movl $'0',%edx        # verificare daca chr e cifra
    cmp %edx,%ebx
    jl exit_while
    movl $'9',%edx
    cmp %edx,%ebx
    jg exit_while

    subl $'0',%ebx        # transformam ebx in int si il adaugam
    movl $10,%edx
    mull %edx
    addl %ebx,%eax

    inc %ecx
    jmp et_while

exit_while:
    pop %ebx
    pop %edi
    pop %ebp
    ret

.global main
main:
    push $sir             # citire sir
    push $formatScanf
    call scanf
    addl $8,%esp

    push $sir             # apel atoi
    call atoi
    pop %ebx

    push %eax              # afisare numar
    push $formatPrintf
    call printf 
    addl $8,%esp

et_exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80
