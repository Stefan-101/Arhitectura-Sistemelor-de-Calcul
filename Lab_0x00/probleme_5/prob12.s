.data
	n: .long 5
	v: .long 1,2,3,4,5
	suma: .space 4
	str: .asciz "Suma: %d. Media: %d rest %d\n"
.text
.global main
main:
	xor %ecx,%ecx
	movl $0,suma
	lea v,%edi
	
et_while:
	cmp %ecx,n
	je afis

	movl (%edi,%ecx,4),%eax
	addl %eax,suma
	incl %ecx
	jmp et_while
	
afis:
	movl suma,%eax
	xor %edx,%edx
	divl n
	push %edx
	push %eax
	push suma
	push $str
	call printf
	add $16,%esp
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
