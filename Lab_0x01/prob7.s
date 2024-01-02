.data
	formatPrintf: .asciz "%d\n"
.text
.global main
aduna:
	push %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%eax
	addl 12(%ebp),%eax
	
	pop %ebp
	ret	
	
iteratie:
	push %ebp
	movl %esp,%ebp
	
	movl 8(%ebp),%edx
	push 0(%edx)
	
	movl 12(%ebp),%edx
	push 0(%edx)
	
	call aduna
	
	addl $8,%esp
	
	movl 12(%ebp),%edx
	movl 0(%edx),%ecx
	movl 8(%ebp),%edx
	movl %ecx,0(%edx)
	
	movl 12(%ebp),%edx
	movl %eax,0(%edx)
	
	pop %ebp
	ret
main:
	subl $16,%esp
	movl $5,0(%esp) #n
	movl $1,4(%esp) #x
	movl $1,8(%esp) #y
	movl %esp,%ebp
	
	movl $2,%ecx
	for_loop:
		cmp 0(%esp),%ecx
		je for_exit
		
		push %ecx
		
		movl %ebp,%ebx
		addl $8,%ebx
		push %ebx
		
		subl $4,%ebx
		push %ebx
		
		call iteratie
		
		addl $8,%esp
		
		pop %ecx
		inc %ecx
		
		jmp for_loop
		
	for_exit:
	movl 8(%ebp),%eax
	movl %eax,12(%ebp)
	
	# print z
	push 12(%ebp)
	push $formatPrintf
	call printf
	addl $8,%esp
	
	addl $16,%esp
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
