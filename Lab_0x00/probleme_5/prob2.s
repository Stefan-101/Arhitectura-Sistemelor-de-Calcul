.data
	ls: .asciz "Less than 0\n"
	eq: .asciz "Is 0\n"
	grt: .asciz "Greater than 0\n"
.text
.global main
main:
	movl $6352,%eax
	
	xor %ebx,%ebx
	cmp %ebx,%eax
	jg greater
	jl less
	jmp equal
	
greater:
	pushl $grt
	jmp afis
less:
	pushl $ls
	jmp afis
equal:
	pushl $eq
	jmp afis
afis:
	call printf
	pop %ebx
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
