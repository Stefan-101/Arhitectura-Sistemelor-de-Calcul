.data
	formatPrintf: .asciz "%d\n"
.text
.global main
factorial:
	push %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%ecx
	movl $1,%eax
	cmp $1,%ecx
	je return
	decl %ecx
	push %ecx
	call factorial
	addl $4,%esp
	
	incl %ecx
	mul %ecx
	
	return:
		pop %ebp
		ret
main:
	push $5
	call factorial
	addl $4,%esp
	
	push %eax
	push $formatPrintf
	call printf
	addl $4,%esp
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
