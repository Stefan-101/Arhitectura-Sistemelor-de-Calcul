.data
	n: .space 4
	v: .space 80
	x: .space 4
	formatScanf: .asciz "%d"
	formatPrintf: .asciz "Sunt %d numere perfecte!\n"
.text

perfect:
	push %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%eax    # impartim x la 2 pt for
	xor %edx,%edx
	movl $2,%ecx
	div %ecx
	
	push %ebx
	xor %ebx,%ebx
	movl %eax,%edx
	movl $1,%ecx
et_for:
	cmp %edx,%ecx
	jg exit_for
	
	push %edx           # calculam restul
	movl 8(%ebp),%eax
	xor %edx,%edx
	div %ecx
	
	xor %eax,%eax       # comparam restul cu 0
 	cmp %edx,%eax
	jne fail
	add %ecx,%ebx       # adaugam divizorul la suma
fail:
	pop %edx
	inc %ecx
	jmp et_for
	
exit_for:
	movl 8(%ebp),%eax
	cmp %eax,%ebx
	je true
false:
	pop %ebx
	pop %ebp
	xor %eax,%eax       # returnam 0
	ret
true:
	pop %ebx
	pop %ebp
	movl $1,%eax         # returnam 1
	ret
	
	
	
.global main
main:
	                           # citim n
	push $n
	push $formatScanf
	call scanf
	addl $8,%esp
	
	                     # citim vectorul cu n elemente
	
	lea v,%edi
	xor %ecx,%ecx
main_for:
	cmp n,%ecx
	je calc

	push %ecx
	push $x
	push $formatScanf
	call scanf
	addl $8,%esp
	pop %ecx
	
	movl x,%eax
	movl %eax,(%edi,%ecx,4)
	inc %ecx
	jmp main_for
	
 	
calc:               # calculam numarul de elemente perfecte	
	xor %ecx,%ecx
	xor %edx,%edx
calc_for:
	cmp n,%ecx
	je afis
	
	push %ecx         # verificam daca numarul este perf
	push %edx
	push (%edi,%ecx,4)
	call perfect
	pop %ebx
	pop %edx
	pop %ecx
	
	xor %ebx,%ebx           # daca este perfect inc %edx
	cmp %eax,%ebx
	je not_perf
	inc %edx	
not_perf:
	inc %ecx
	jmp calc_for
	
		
	
afis:                     # afisam nr de elem perfecte din edx
	push %edx
	push $formatPrintf
	call printf
	addl $8,%esp
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80



