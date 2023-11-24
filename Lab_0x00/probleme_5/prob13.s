.data
	x: .long 4
	str: .asciz "%d\n"
.text
.global main
factorial:
	push %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %eax,%ecx
	
	movl $1,%edx
	cmp %eax,%edx
	jge fact_exit
	
	decl %ecx
	
et_while:
	mull %ecx
	loop et_while
	
	pop %ebp
	ret
	
fact_exit:
	movl $1,%eax
	pop %ebp
	ret
	
main:
	push x
	call factorial
	pop %ebx
	push %eax
	push $str
	call printf
	add $8,%esp
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
