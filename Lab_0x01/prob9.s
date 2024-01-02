.data
	formatPrintf: .asciz "Al %d-lea element Fibonacci este %d.\n"
	t0: .long 0
	t1: .long 1
.text
.global main
fibo:
	push %ebp
	movl %esp,%ebp
	
	movl $1,%ecx
	movl $0,%eax
	cmp 8(%ebp),%ecx
	jge return_1
	
	movl 8(%ebp),%ecx
	decl %ecx
	
	push %ecx
	call fibo
	addl $4,%esp
	
	return_1:
		movl %eax,%edx
		addl %ecx,%eax
		movl %edx,%ecx
		
		pop %ebp
		ret
		
main:
	push $6
	call fibo
	addl $4,%esp
	
	push %eax
	push $6
	push $formatPrintf
	call printf
	addl $12,%esp
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
