.data
    filein: .asciz "in.txt"
    fileout: .asciz "out.txt"
    fd: .space 4            # file descriptor
    buff: .zero 1024        # buffer
    endl: .ascii "\n"       
.text

# Functia atoi_impl este o implementare a functiei atoi
atoi_impl:
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
        xor %edx,%edx
        cmp %ebx,%edx
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

# Functia readf citeste intr-un buffer specificat o linie dintr-un fisier
# Parametrii: file_descriptor, buffer_address
readf:
    push %ebp
    movl %esp,%ebp
    push %ebx

    movl 8(%ebp),%ebx       # file descriptor
    movl 12(%ebp),%ecx      # buffer address
    
    while_not_eol:      # while not end of line
        push %ebx
        push %ecx

        # efectuam citirea unui byte din fisier folosind syscall in urmatoarea
        # locatie din buffer
        movl $3,%eax
        # ebx = fd
        # ecx = buff address
        movl $1,%edx
        int $0x80

        pop %ecx
        pop %ebx

        # verificam daca byte-ul citit este '\n'
        movb 0(%ecx),%al
        incl %ecx
        movb $0x0A,%dl 
        cmp %dl,%al
        je exit_while_not_eol
        jmp while_not_eol

    exit_while_not_eol:
    pop %ebx
    pop %ebp

    ret

# Functia writef scrie intr-un fisier o anumita lungime dintr-un buffer
# Parametrii: file_descriptor, buffer_address, length
writef:
    push %ebp
    movl %esp,%ebp
    push %ebx

    movl $4,%eax
    movl 8(%ebp),%ebx       # file descriptor
    movl 12(%ebp),%ecx      # buffer address
    movl 16(%ebp),%edx      # length
    int $0x80

    pop %ebx
    pop %ebx

    ret

# Functia cif_to_ascii primeste ca parametru 0 sau 1 (.long) si returneaza
# codul ascii pt 0 sau 1 respectiv
cif_to_ascii:
    push %ebp
    movl %esp,%ebp

    movl 8(%ebp),%eax
    addl $48,%eax

    pop %ebp
    ret
    

.global main
main:

    push $1
    call cif_to_ascii
    pop %ebx
bp0:

# open file for reading
    movl $5,%eax
    movl $filename, %ebx
    movl $0,%ecx
    movl $0666,%edx
    int $0x80

    movl %eax,fd

    # read one number from file using function

    push $buff
    push fd
    call readf
    addl $8,%esp

    # transform number to integer from str

    push $buff 
    call atoi_impl
    addl $4,%esp
bp1: # eax = number

    # close input file
    movl $6,%eax
    movl fd,%ebx
    int $0x80

    # open file for writing
    movl $5,%eax
    movl $filenameo, %ebx
    movl $0x41,%ecx     # O_CREAT and O_WRONLY flag
    movl $0666,%edx
    int $0x80
    movl %eax,fd
bp2:
# test print

push $buff
push $formatPrintf
call printf
addl $8,%esp

# write in opened file

    movl $4,%eax
    movl fd,%ebx
    movl $buff,%ecx
    movl $2,%edx
    int $0x80

# write using function

    push $2
    push $buff 
    push fd 
    call writef 
    addl $12,%esp

# write endol

    push $1
    push $endl
    push fd
    call writef 
    addl $12,%esp

# close file

    movl $6,%eax
    movl fd,%ebx
    int $0x80



et_exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80
