.data
	# consideram un tablou sortat
	v: .long 2,8,15,29,32,44,100,256,1024,1025
	n: .long 10
	st: .space 4
	dr: .space 4
	mij: .space 4
	val_cautata: .long 16
	strGasit: .asciz "Nr a fost gasit pe poz %d\n"
	strFail: .asciz "Numarul nu exista\n"
.text
.global main
main:
	lea v,%edi
	movl $0,st
	push n #movl n,dr
	pop dr
	decl dr 
	
et_loop:
	movl dr,%eax
	cmp st,%eax
	je terminate
	
	#calculam mijlocul
	movl st,%eax
	addl dr,%eax
	shr $1,%eax
	movl %eax,mij
	
	movl mij,%ecx
	movl (%edi,%ecx,4),%ebx
	cmp %ebx,val_cautata
	je gasit
	jg goto_dr
	jl goto_st
	
	goto_dr:
		incl mij
		movl mij,%eax
		movl %eax,st
		jmp et_loop
	
	goto_st:
		decl mij
		movl mij,%eax
		movl %eax,dr
		jmp et_loop
	
	
gasit:
	push %ecx
	push $strGasit
	call printf
	add $8,%esp
	jmp et_exit
	
terminate:
	movl (%edi,%eax,4),%ebx
	movl %eax,%ecx
	cmp %ebx,val_cautata
	je gasit
	
fail:
	push $strFail
	call printf
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
