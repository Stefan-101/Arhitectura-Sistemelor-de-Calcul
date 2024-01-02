.data
	formatPrintf: .asciz "%d\n"
.text
.global main
combinari:
	push %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%ecx	#n
	movl 12(%ebp),%edx 	#k
	
	cmp $0,%edx
	je ret_1
	cmp %ecx,%edx
	je ret_1
	
	push %ebx
	
	decl %ecx
	push %edx
	push %ecx
	call combinari
	pop %ecx
	pop %edx
	
	movl %eax,%ebx
	
	decl %edx
	push %edx
	push %ecx
	call combinari
	addl $8,%esp
	
	addl %ebx,%eax
	
	pop %ebx
	pop %ebp
	ret
	
	ret_1:
		movl $1,%eax
		pop %ebp
		ret
		
main:
	push $3
	push $5
	call combinari
	addl $8,%esp
bp1:
	push %eax
	push $formatPrintf
	call printf
bp2:
	addl $8,%esp

et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
