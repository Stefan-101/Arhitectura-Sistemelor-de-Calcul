.data
	x: .long 0x0a0b0c0d
	y: .space 4
.text

memcpy:
	push %ebp
	movl %esp,%ebp
	push %ebx
	
	movl 8(%ebp),%eax   # extragem parametrii
	movl 12(%ebp),%ebx
	movl 16(%ebp),%edx
	
	xor %ecx,%ecx

et_for:                      # mutam byte cu byte
	cmp %ecx,%edx
	je exit_for
	
	push %edx
	movb (%ebx,%ecx,1),%dl
	movb %dl,(%eax,%ecx,1)
	pop %edx
	
	inc %ecx
	jmp et_for
	
exit_for:
	movl %ebx,%eax         # returnam adresa dest
	pop %ebx
	pop %ebp
	ret	

.global main
main:
	push $3
	push $x
	push $y
	call memcpy
	addl $12,%esp


et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80



	
