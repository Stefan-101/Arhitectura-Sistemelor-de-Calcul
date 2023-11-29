.data
    m: .space 4        # linii
    n: .space 4        # coloane
    p: .space 4        # nr de celule vii
    lineIndex: .space 4
    colIndex: .space 4
    matrix: .zero 1600
    cp_matrix: .zero 1600
    k: .space 4        # nr de evolutii
    x: .space 4
    y: .space 4
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d "
    endl: .asciz "\n"
.text
.global main
main:
    # citim numarul de linii

    push $m
    push $formatScanf
    call scanf
    add $8,%esp

    # citim numarul de coloane

    push $n
    push $formatScanf
    call scanf
    add $8,%esp

    # citim numarul de celule vii

    push $p
    push $formatScanf
    call scanf
    add $8,%esp

    # citim celulele vii (matricea)

    xor %ecx,%ecx
    lea matrix,%edi

    for_p:
        cmp p,%ecx
        je exit_for_p

        push %ecx       # salvam valoarea lui ecx

        push $x         # citim x
        push $formatScanf
        call scanf
        add $8,%esp

        push $y         # citim y
        push $formatScanf
        call scanf
        add $8,%esp

        pop %ecx        # restauram valoarea lui ecx

        incl x          # matricea este bordata => coord++
        incl y

        movl x,%eax
        mull n
        addl y,%eax
        movl $1,(%edi,%eax,4)
        inc %ecx
        jmp for_p

exit_for_p:

    # citim k (numarul de evolutii)

    push $k
    push $formatScanf
    call scanf
    addl $8,%esp

    # calculam evolutiile

    lea matrix,%esi
    lea cp_matrix,%edi

    for_evolutii:
        xor %ecx,%ecx
        cmp k,%ecx
        je exit_for_evolutii

        movl $1,lineIndex

        for_lines_ev:
            movl lineIndex,%ecx
            cmp m,%ecx
            jg cont_for_evolutii

            movl $1,colIndex

            for_columns_ev:
                movl colIndex,%ecx
                cmp n,%ecx
                jg cont_for_lines_ev

                # calculam pozitia in matrice

                mov lineIndex,%eax
                mull n
                addl colIndex,%eax

                # TODO calculam daca o celula devine 1 sau 0

                incl colIndex
                jmp for_columns_ev
                
        cont_for_lines_ev:
            incl lineIndex
            jmp for_lines_ev
    cont_for_evolutii:

        # TODO matrix=cp_matrix
        movl m,%eax
        movl n,%ebx
        addl $2,%eax
        addl $2,%ebx
        mull %ebx

        xor %ecx,%ecx
        for_elem:
            cmp %eax,%ecx
            jg exit_for_elem

            movl (%edi,%ecx,4),%edx
            movl %edx,(%esi,%ecx,4)

            incl %ecx
            jmp for_elem
        exit_for_elem:
        decl k
        jmp for_evolutii

exit_for_evolutii:

    # afisam matricea

    movl $1,lineIndex
    lea matrix,%esi
    for_lines:
        movl lineIndex,%ecx
        cmp m,%ecx
        jg et_exit

        movl $1,colIndex
        for_columns:
            mov colIndex,%ecx
            cmp n,%ecx
            jg cont_for_lines
            
            # calculam pozitia in matrice

            mov lineIndex,%eax
            mull n
            addl colIndex,%eax

            # afisam elementul din matrice

            movl (%esi,%eax,4),%ebx
            push %ebx
            push $formatPrintf
            call printf 
            addl $8,%esp

            incl colIndex
            jmp for_columns
    cont_for_lines:
        push $endl
        call printf
        add $4,%esp
        incl lineIndex
        jmp for_lines


et_exit:
    movl $1,%eax
    xor %ebx,%ebx
    int $0x80
