.data
	str: .asciz "%d\n"
.text
.global main
main:
	movl $64,%eax  #valoarea lui eax
	movl $1,%ebx
	xor %ecx,%ecx
et_while:
	cmp %eax,%ebx
	je afis
	shr $1,%eax
	incl %ecx
	jmp et_while
	
afis:
	incl %ecx
	pushl %ecx
	pushl $str
	call printf
	pop %ebx
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
