.data
	flg: .byte 0
	cnt: .long 0
	maxim: .long 0
	str: .asciz "%d\n"
.text
.global main
main:
	movl $473,%eax
	
	movl $1,%ebx
	xor %ecx,%ecx

et_while:
	cmp %ecx,%eax
	je afis
	
	movl $1,%ebx
	and %eax,%ebx
	shr $1,%eax
	cmp %ebx,%ecx
	je verif
	jmp add
	
	verif:
		movl cnt,%edx
		cmp maxim,%edx
		jg actualizare_maxim
		movl $0,cnt
		jmp et_while
		
		actualizare_maxim:
			movl %edx,maxim
			movl $0,cnt
			jmp et_while
		
	add:
		incl cnt
		jmp et_while

afis:
	#inainte de afisare mai verificam cnt si maxim o data
	
	movl cnt,%edx
	cmp maxim,%edx
	jle print
	movl %edx,maxim
	
print:
	pushl maxim
	push $str
	call printf
	pop %ebx
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80






	
