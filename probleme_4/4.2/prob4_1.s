.data
	x: .long 9409
	d: .long 2
	fail: .asciz "fail\n"
	pass: .asciz "pass\n"
.text
.global main
main:
et_while:
	movl d,%eax
	mul %eax
	cmp x,%eax
	jg et_pass	
	
	movl $0,%edx
	movl x,%eax
	divl d
	movl $0,%ebx
	cmp %edx,%ebx
	je et_fail
	incl d
	jmp et_while
	
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
