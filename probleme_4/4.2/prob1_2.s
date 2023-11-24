.data
	x: .long 32
	y: .long 16
.text
.global main
main: 
	movl x,%eax
	shr $4,%eax
	movl y,%ebx
	shl $4,%ebx
	addl %ebx,%eax
