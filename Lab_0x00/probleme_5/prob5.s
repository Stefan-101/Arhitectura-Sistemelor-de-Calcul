.data
	cnt: .space 4
	str: .asciz "%d\n"
.text
.global main
main:
	movl $743,%eax
	movl $1,%ebx
	xor %edx,%edx
	
et_while:
	cmp %eax,%edx
	je afis
	movl %eax,%ecx
	and %ebx,%ecx
	shr $1,%eax
	cmp %edx,%ecx
	je et_while
	incl cnt
	jmp et_while
	
afis:
	pushl cnt
	push $str
	call printf
	pop %ebx
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
