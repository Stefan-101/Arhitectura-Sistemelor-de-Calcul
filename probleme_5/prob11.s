.data
	x: .long 10
	str: .asciz "%d "
	newln: .asciz "\n"
	a: .long 1
	b: .long 1
.text
.global main
main:
	movl x,%eax
	sar $31,%eax
	xor %eax,x
	subl %eax,x
	
	# afisam 1 1
	push a
	push $str
	call printf
	push $0
	call fflush
	add $4,%esp
	call printf
	push $0
	call fflush
	add $4,%esp
	
	subl $2,x
	
	# incarcam a si b in eax si ebx
	movl a,%eax
	movl b,%ebx
	
	#calculam restul termenilor
	
	xor %edx,%edx
et_while:
	cmp x,%edx
	je et_exit
	
	push %ebx
	add %eax,%ebx
	pop %eax
	
	# afisam ebx
	push %eax
	push %ebx
	push $str
	call printf
	add $8,%esp
	push $0
	call fflush
	add $4,%esp
	pop %eax
	
	# decrementam x
	decl x
	
	jmp et_while
	
et_exit:
	push $newln
	call printf
	pop %ebx

	movl $1,%eax
	movl $0,%ebx
	int $0x80
	
