.data
	v: .long 1,22,3,3,5,22,22
	n: .long 8
	cnt: .long 1
	str: .asciz "%d %d\n"
.text
.global main
main:
	movl $v,%edi
	movl $0,%ecx
	movl (%edi,%ecx,4),%eax

et_for:
	cmp %ecx,n
	je afis
	
	movl (%edi,%ecx,4),%ebx
	cmp %eax,%ebx
	jg greater
	je equal
	jmp cont
	
	greater:
		movl %ebx,%eax
		movl $1,cnt
		jmp cont
	
	equal:
		incl cnt
	cont:
	incl %ecx
	jmp et_for

afis:
	push cnt
	push %eax
	push $str
	call printf
	pop %ebx
	pop %ebx
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80






		
