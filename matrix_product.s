;Charlotte Pook Quentin Lebon
.data
    tab1: .word 11,12,13,14,            21,22,23,24,            31,32,33,34,               41,42,43,44

    tab2: .word 1,2,3,4,                5,6,7,8,                9,10,11,12,                13,14,15,16
                
    tab3: .word 0,0,0,0,                0,0,0,0,                0,0,0,0,                   0,0,0,0

    nbr_valeur: .word 4

; R1 cpt colonne
; R2 cpt valeur
; R3 somme_tmp
; R4 shift_ligne_mat1 ++8
; R5 shift_colonne_mat2 ++32 remttre a start a la fin
; R6 start_offset 0 -> 8 -> 16
; R7 shift_ligne_res 0 -> 8 -> 16
; R8 tab1
; R9 tab2
; R10 res multiply
; R11 Nombre de valeur par ligne/colonne (taille)
; R12 start_ligne 0 -> 32 ->
; r13 compteur ligne

.text
    lw r11,nbr_valeur(r0)

boucle1:    lw r8,tab1(r4)
            lw r9,tab2(r5)
            dmult r8,r9   
            mflo r10
            dadd r3,r3,r10

            ;augmente les compteurs
            daddi r4,r4,#8
            daddi r5,r5,#32
            daddi r2,r2,#1

            
            bne r11,r2,boucle1

            sw r3,tab3(r7)
            movn r3,r0,r3

            daddi r7,r7,#8
            daddi r6,r6,#8
            movn r5,r6,r5
            movn r4,r12,r4
            movn r2,r0,r2
            daddi r1,r1,#1

            bne r1,r11,boucle1
            daddi r12,r12,#32

            movn r1,r0,r1
            movn r6,r0,r6
            movn r5,r6,r5
            movn r4,r12,r12
            daddi r13,r13,#1

            bne r13,r11,boucle1
            
            halt
