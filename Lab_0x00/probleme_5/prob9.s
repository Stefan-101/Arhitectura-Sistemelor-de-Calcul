.data
	x: .long -12
	str: .asciz "%d\n"
.text
.global main
main:
	# calculam valoarea absoluta si cautam divizorii
	movl x,%eax
	sar $31,%eax
	xor %eax,x
	subl %eax,x
	
	movl $2,%ecx
	xor %ebx,%ebx
	
et_while:
	cmp x,%ecx
	je et_exit

	movl x,%eax
	xor %edx,%edx
	div %ecx
	
	cmp %edx,%ebx
	je afis
	incl %ecx
	jmp et_while
	
	afis:
		push %ecx
		push %ecx
		push $str
		call printf
		add $8,%esp
		pop %ecx
	
	incl %ecx
	jmp et_while
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80	
	
	
	
	
	
	
	
	
