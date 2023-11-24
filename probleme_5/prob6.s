.data
	cnt: .long 0
	str: .asciz "%d\n"
.text
.global main
main:
	movl $1900,%eax
	
	movl $1,%ecx
	movl $2,%ebx	
et_while:
	cmp %eax,%ecx
	je afis
	xor %edx,%edx
	div %ebx
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
