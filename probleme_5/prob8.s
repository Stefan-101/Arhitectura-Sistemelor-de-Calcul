.data
	str1: .asciz "true\n"
	str2: .asciz "false\n"
.text
.global main
main:
	movl $171,%eax
	
	xor %ebx,%ebx
	movl %eax,%ecx
et_while:
	xor %edx,%edx
	cmp %ecx,%edx
	je ex_while
	
	shl $1,%ebx
	movl $1,%edx
	and %ecx,%edx
	or %edx,%ebx
	shr %ecx
	jmp et_while
	
ex_while:
	cmp %eax,%ebx
	je true
	jmp false
	
true:
	push $str1
	jmp afis
false:
	push $str2
	jmp afis
	
afis:
	call printf
	pop %ebx
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80














