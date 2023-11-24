.data
	s: .space 13
.text
.global main
main:
	movl $3,%eax
	movl $0,%ebx
	movl $s,%ecx
	movl $12,%edx
	int $0x80
	
	movl $4,%eax
	movl $1,%ebx
	movl $s,%ecx
	movl $12,%edx
	int $0x80
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
