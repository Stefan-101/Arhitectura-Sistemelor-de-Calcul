.data
	s: .space 4
	s1: .space 4
	
	formatPrintf: .asciz "%d\n"
.text
.global main
aduna:
	push %ebp
	movl %esp,%ebp
	
	push %edi
	movl 8(%ebp),%edi
	xor %ecx,%ecx
	
	movl $0,0(%edi)
	for_loop:
		cmp 12(%ebp),%ecx
		je for_exit
		
		push %ecx
		addl $4,%ecx
		movl (%ebp,%ecx,4), %edx
		addl %edx,0(%edi)
		pop %ecx
		inc %ecx
		jmp for_loop
	for_exit:
	pop %edi
	pop %ebp
	ret
main:
	push $3
	push $2
	push $1
	push $3
	push $s
	call aduna
	addl $20,%esp
	
	push $20
	push $10
	push $2
	push $s1
	call aduna
	addl $16,%esp
	
	push s
	push $formatPrintf
	call printf
	addl $8,%esp
	
	push s1
	push $formatPrintf
	call printf
	addl $8,%esp
	
et_exit:
	movl $1,%eax
	xor %ebx,%ebx
	int $0x80
	
