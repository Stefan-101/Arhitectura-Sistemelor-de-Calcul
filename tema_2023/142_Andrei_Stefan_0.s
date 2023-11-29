.data
    m: .space 4        # linii
    n: .space 4        # coloane
    n_bordat: .space 4 # coloane bordate
    p: .space 4        # nr de celule vii
    lineIndex: .space 4
    colIndex: .space 4
    matrix: .zero 1600
    cp_matrix: .zero 1600
    k: .space 4        # nr de evolutii
    x: .space 4
    y: .space 4
    cel_curenta: .space 4
    nr_vecini_vii: .space 4
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d "
    formatPrintfn: .asciz "%d\n"
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
    movl n,%eax
    addl $2,%eax
    movl %eax,n_bordat

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
        mull n_bordat
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
                movl n_bordat,%ebx
                mull %ebx          # mull (n+2)
                addl colIndex,%eax

                movl (%esi,%eax,4),%ebx
                movl %ebx,cel_curenta

                # calculam numarul de vecini vii
                movl $0,nr_vecini_vii

                subl n_bordat,%eax         # vecinul din stanga sus (scadem n+2+1)
                subl $1,%eax

                movl $3,%ecx
                for_linie_vecini:
                    push %ecx
                    movl $3,%ecx
                    for_vecini:
                        movl (%esi,%eax,4),%edx
                        addl nr_vecini_vii,%edx
                        movl %edx,nr_vecini_vii
                        
                        incl %eax
                        loop for_vecini

                    addl n,%eax         # eax+=n-1
                    decl %eax

                    pop %ecx
                    loop for_linie_vecini

                movl nr_vecini_vii,%edx
                subl cel_curenta,%edx
                movl %edx,nr_vecini_vii

                push nr_vecini_vii
                push $formatPrintfn
                call printf
                add $8,%esp

                # TODO scriem in cp_mat celula

                incl colIndex
                jmp for_columns_ev
                
        cont_for_lines_ev:
            incl lineIndex
            jmp for_lines_ev
    cont_for_evolutii:

        # calculam cate elemente trebuie sa parcurgem
        movl m,%eax
        movl n,%ebx
        addl $2,%eax
        addl $2,%ebx
        mull %ebx

        xor %ecx,%ecx
        for_elem:
            cmp %eax,%ecx
            je exit_for_elem

            # copiem in matrix elementele din cp_matrix
            movl (%edi,%ecx,4),%edx
            # movl %edx,(%esi,%ecx,4)

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
            mull n_bordat
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
