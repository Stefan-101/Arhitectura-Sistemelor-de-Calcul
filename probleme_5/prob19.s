.data
	n: .long 15
	str: .asciz "%d\n"
.text
.global main
main:
	movl $1,%ecx
	
et_while:
	movl %ecx,%eax
	mul %ecx
	
	cmp n,%eax
	jge gasit
	incl %ecx
	jmp et_while
	
gasit:
	cmp n,%eax
	je afis
	decl %ecx

afis:
	push %ecx
	push $str
	call printf
	addl $8,%esp
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
