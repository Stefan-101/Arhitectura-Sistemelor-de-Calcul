.data
	s: .asciz "Aceasta este o propozitie\n"
	t: .space 27
	len: .long 25
.text
.global main
main:
	movl $s,%esi
	movl $t,%edi
	decl len
	movl len,%ecx
	movl $0,%edx
	
et_for:
	cmp len,%edx
	jg afis
	movb (%esi,%ecx,1),%al
	movb %al,(%edi,%edx,1)
	incl %edx
	decl %ecx
	jmp et_for
	
afis:
	movb $0x0A,(%edi,%edx,1) # 0x0A = \n

	pushl $t
	call printf
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
