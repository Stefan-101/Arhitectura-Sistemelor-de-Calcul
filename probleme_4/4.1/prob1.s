.data
	x: .long 2
	y: .long 3
.text
.global main
main:
	movl x,%eax
	movl y,%ebx
	xchg %eax,%ebx
	movl %eax,x
	movl %ebx,y
