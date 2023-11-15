.data
	v: .long -334, 151, -522, -887, -46, -391, 698, 238, -403, -468, -1018, -458, 493, -66, -934, -564, 218, -878, -102, 387, -739, 33, -353, 867, 341, -382, 988, 455, 370, -449, 280, 296, 926, -180, 552, 589, -972, -435, 239, -987, 570, 642, -121, 601, -662, -143, -692, -314, -1012, 43, -594, 696, 306, -68, -790, -821, -1021, -243, -990, 183, 0, 1006, -451, -96, -688, 973, -987, -58, -601, -194, -418, -823, 518, 875, -479, 144, -531, -128, -109, -299, -488, -646, -759, 217, 203, 788, 631, 831, 110, 570, 207, 964, -453, -71, 505, 74, 643, 717, -538, -991, -481
	n: .long 101
	str: .asciz "%d "
	newln: .asciz "\n"
.text
.global main
main:
	lea v,%edi
	decl n
	xor %ecx,%ecx
	
	# sortam vectorul
	for1:
		cmp %ecx,n
		je exit_for1
		
		movl (%edi,%ecx,4),%eax
		push %ecx # salvam indexul curent pt for1
		incl %ecx
		for2:
			cmp n,%ecx
			jg exit_for2
			
			movl (%edi,%ecx,4),%ebx
			cmp %eax,%ebx
			jl swap
			incl %ecx
			jmp for2
			
			swap:
				xchg %eax,%ebx
				movl %ebx,(%edi,%ecx,4)
				pop %edx
				movl %eax,(%edi,%edx,4)
				push %edx
				incl %ecx
				jmp for2
		exit_for2:
		pop %ecx # restauram indexul pentru for1
		incl %ecx
		jmp for1
	
	exit_for1:
	xor %ecx,%ecx
	
	# afisam vectorul
et_while:
	cmp n,%ecx
	jg et_exit
	
	movl (%edi,%ecx,4),%eax
	push %ecx
	push %eax
	push $str
	call printf
	add $8,%esp
	push $0
	call fflush
	add $4,%esp
	pop %ecx
	incl %ecx
	jmp et_while
	
et_exit:
	push $newln
	call printf
	pop %ebx

	movl $1,%eax
	movl $0,%ebx
	int $0x80
	
	
	
	
			
		
