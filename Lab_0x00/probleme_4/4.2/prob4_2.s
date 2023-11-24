.data
	x: .long 97
	d: .space 4
	fail: .asciz "fail\n"
	pass: .asciz "pass\n"
.text
.global main
main:
	movl $0,%edx
	movl x,%eax
	movl $2,%ebx
	divl %ebx
	movl %eax,%ecx
	
et_while:
	movl $2,%ebx
	cmp %ebx,%ecx
	je et_pass
	
	movl $0,%edx
	movl x,%eax
	divl %ecx
	movl $0,%ebx
	
	cmp %ebx,%edx
	je et_fail
	loop et_while
	
et_fail:
	push $fail
	call printf
	pop %ebx
	jmp et_exit
	
et_pass:	
	push $pass
	call printf
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
