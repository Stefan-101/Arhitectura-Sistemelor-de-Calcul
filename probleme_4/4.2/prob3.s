.data
	a: .long -1
	b: .long 2
	c: .long -10
	min: .space 4
.text
.global main
main:
	movl a,%eax
	movl b,%ebx
	movl c,%ecx
	
	cmp %eax,%ebx
	jl et_b
	jmp et_a
	
et_a:
	cmp %eax,%ecx
	jl min_c
	jmp min_a
	
et_b:
	cmp %ebx,%ecx
	jl min_c
	jmp min_b

min_a:
	movl %eax,min
	jmp et_exit
	
min_b:
	movl %ebx,min
	jmp et_exit

min_c: 
	movl %ecx,min
	jmp et_exit
	
et_exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
