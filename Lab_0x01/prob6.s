.data
	formatPrintf: .asciz "\%ld"
	endl: .asciz "\n"
.text
.global main
proc:
	push %ebp
	movl %esp,%ebp
	push %ebx
	
	movl 8(%ebp),%ebx
	push %ebx
	push $formatPrintf
	call printf
	addl $8,%esp
	
	xor %ecx,%ecx
	cmp %ebx,%ecx
	je return
	
	decl %ebx
	push %ebx
	call proc
	addl $4,%esp
	return:
		pop %ebx
		pop %ebp
		ret
main:
	push $5
	call proc
	addl $4,%esp
	
	push $endl
	call printf
	addl $4,%esp
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
	
