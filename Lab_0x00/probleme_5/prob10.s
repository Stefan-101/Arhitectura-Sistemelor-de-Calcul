.data
	str: .asciz "%d\n"
.text
.global main
main:
	xor %eax,%eax
	movb $14,%al
	movb $9,%ah
	
	push %eax
	push $str
	call printf
	pop %ebx
	pop %ebx
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
