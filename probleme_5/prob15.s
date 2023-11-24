.data
	v: .long 1245, 342, 543523, 342, 4234, 1245, 543523
	n: .long 7
	str: .asciz "%d\n"
.text
.global main
main:
	xor %ecx,%ecx
	lea v,%edi
	xor %eax,%eax
	
et_while:
	cmp %ecx,n
	je afis
	
	movl (%edi,%ecx,4),%ebx
	xor %ebx,%eax
	incl %ecx
	jmp et_while

afis:
	push %eax
	push $str
	call printf
	add $8,%esp
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
