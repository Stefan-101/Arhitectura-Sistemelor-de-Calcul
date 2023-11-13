.data
	x: .long 16
	y: .long 268435456
.text
.global main
main:
	movl x,%eax
	movl $0,%edx
	movl $16,%ebx
	divl %ebx
	movl %eax,x
	
	movl y,%eax
	mull %ebx
	addl x,%eax
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
