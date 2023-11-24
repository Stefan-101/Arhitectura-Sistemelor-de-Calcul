.data
	n: .long 5
	v: .long 15,2,3,14,-21
	min1: .space 4
	min2: .space 4
	str: .asciz "%d %d\n"
.text
.global main
main:
	xor %ecx,%ecx
	lea v,%edi
	movl (%edi,%ecx,4),%eax
	movl %eax,min1
	incl %ecx
	mov (%edi,%ecx,4),%eax
	movl %eax,min2
	incl %ecx
	
et_while:
	cmp n,%ecx
	je afis
	
	movl (%edi,%ecx,4),%eax
	incl %ecx
	cmp %eax,min1
	jle act
	
	push min1
	pop min2
	movl %eax,min1
	jmp et_while
	
	act:
		cmp %eax,min2
		jle et_while
	
		movl %eax,min2
	jmp et_while
	
afis:
	push min2
	push min1
	push $str
	call printf
	add $12,%esp
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
	
	
	
	
	
	
