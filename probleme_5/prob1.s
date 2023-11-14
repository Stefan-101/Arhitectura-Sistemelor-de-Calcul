.data
	num: .long 1
	copie_eax: .space 4
	aux: .space 4
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
	movl $15,%eax
	movl $17,%ebx
	movl $19,%ecx
	
	shl $1,%eax
	addl %ebx,%eax
	shl $1,%eax
	addl %ecx,%eax
	shr $1,%eax
m:
	movl $15,%eax
	movl $17,%ebx
	movl $19,%ecx
	
	addl %ebx,%eax
	addl %ecx,%eax
	shl $4,%eax
n:
	movl $15,%eax
	movl $17,%ebx
	
	movl %eax,%ecx
	shr $4,%ecx
	shl $4,%ebx
	addl %ebx,%ecx
o:
	movl $1,%eax
	movl $4294967296,%ebx
	
	movl $0xFF00,%ecx
	and %eax,%ecx
	
	movl $0x00FF,%edx
	and %edx,%ebx
	
	addl %ebx,%ecx
p:
	movl $15,%eax
	movl $17,%ebx
	movl $19,%ecx
	
	movl %eax,%edx
	addl %ecx,%edx
	addl %ebx,%eax
	movl %edx,%ebx
	xor %edx,%edx
	divl %ebx
	movl %eax,%ecx
q:
	movl $50,%eax
	movl $17,%ebx
	movl $19,%ecx
	
	mul %ebx
	xor %edx,%edx
	div %ecx
	xor %edx,%edx
	div %ecx
r:
	movl $44,%eax
	movl $17,%ebx
	movl $19,%ecx
	
	addl %eax,%ebx
	xchg %eax,%ebx
	xor %edx,%edx
	divl %ecx
	incl %eax
	mul %ebx
s:
	movl $5,%eax
	movl %eax,copie_eax
	
	movl $1,%ebx
	addl %eax,%ebx
	movl $2,%ecx
	
	et_for:
	movl $34,%edx
	cmp %ecx,%edx
	je iesire_s
	movl %eax,aux
	movl num,%eax
	mull %ecx
	movl %eax,num
	movl aux,%eax
	
	mull copie_eax
	movl %eax,aux
	xor %edx,%edx
	divl num
	addl %eax,%ebx
	movl aux,%eax
	incl %ecx
	jmp et_for
	iesire_s:












