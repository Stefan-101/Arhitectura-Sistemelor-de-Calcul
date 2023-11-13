.data
	x: .long 256
	y: .long 1
	str1: .asciz "PASS\n"
	str2: .asciz "FAIL\n"
.text
.global main
main: 
	movl x,%eax
	shr $8,%eax
	cmp %eax,y
	je equal
	jmp not_equal
	
equal:
	push $str1
	call printf
	pop %ebx
	jmp et_exit

not_equal:
	push $str2
	call printf
	pop %ebx
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
