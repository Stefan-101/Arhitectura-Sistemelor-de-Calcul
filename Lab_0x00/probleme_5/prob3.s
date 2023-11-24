.data
.text
.global main
main:
	movl $2,%eax
	movl $3,%ebx
	
	xor %eax,%ebx
	xor %ebx,%eax
	xor %eax,%ebx
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
