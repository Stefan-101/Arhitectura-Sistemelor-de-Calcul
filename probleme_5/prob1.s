.data
.text
.global main
main:
	movl $15,%eax
	movl $1,%ebx
a:
	and %ebx,%eax
b:
	xor %eax,%eax
c:
	xor %ebx,%eax
	xor %ebx,%eax
d:
	movl $100,%eax
	movl %eax,%ebx
	decl %ebx
	and %ebx,%eax
e:
	movl $1,%eax
	movl $7,%ebx
	not %ebx
	movl %eax,%ecx
	and %ebx,%ecx
	
	not %ebx
	not %eax
	movl %eax,%edx
	and %ebx,%edx
	
	movl %ecx,%eax
	or %edx,%eax
	
	#echivalent cu: xor %ebx,%eax
f:
	movl $15,%eax
	movl $63,%ebx
	
	movl %eax,%ecx
	not %ecx
	and %ecx,%eax
	
	movl %ebx,%edx
	not %edx
	and %edx,%ebx
	
	or %ebx,%eax
	
	#echivalent cu: movl $0,%eax
g:
	movl $11,%eax
	movl $2,%ebx
	
	movl %eax,%ecx
	movl %ebx,%edx
	not %edx
	or %ecx,%edx
	
	not %eax
	or %ebx,%eax
	and %edx,%eax
h:
	movl $14,%eax
	movl $13,%ebx
	
	movl %eax,%ecx
	not %ecx
	or %ecx,%eax
	
	movl %ebx,%ecx
	not %ecx
	or %ecx,%ebx
	
	and %ebx,%eax
	
	#echivalent cu setarea tuturor bitiilor lui eax (cu 1)
i:
	movl $16,%eax
	movl $15,%ebx
	cmp %eax,%ebx
	jg true_i
	jmp false_i
	true_i:
		xor %ebx,%eax
		movl $-1,%ecx
		and %ecx,%eax
		xor %ebx,%eax
		jmp end_i
	false_i:
		xor %ebx,%eax
		movl $0,%ecx
		and %ecx,%eax
		xor %ebx,%eax
	end_i:
	
	#echivalent cu eax=eax daca eax<ebx
	#              eax=ebx daca eax>=ebx
j:
	movl $15,%eax
	movl $16,%ebx
	cmp %eax,%ebx
	jg true_j
	jmp false_j
	true_j:
		xor %eax,%ebx
		movl $-1,%ecx
		and %ecx,%ebx
		xor %ebx,%eax
		jmp end_j
	false_j:
		xor %eax,%ebx
		movl $0,%ecx
		and %ecx,%ebx
		xor %ebx,%eax
	end_j:
	
	#echivalent cu eax=ebx daca eax<ebx
	#              eax=eax daca eax>=ebx
k:
	movl $3,%eax
	movl $4,%ebx
	movl $5,%ecx
	add %eax,%ebx
	sub %ecx,%ebx
	movl %ebx,%ecx
l:










