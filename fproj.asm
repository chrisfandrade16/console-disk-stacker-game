%include "simple_io.inc"

section .data
    imsg dq "If you want to swap, enter a,b. If you want to stop, enter 0.", 0
    tmsg dq "Program done.", 0
    rmsg dq "Incorrect input, please try again.", 0
    smsg dq "Swapping given values in array...", 0
    l1 dq "..+------+", 0
    l2 dq "..+-----+.", 0
    l3 dq "...+----+.", 0
    l4 dq "...+---+..", 0
    l5 dq "....+--+..", 0
    l6 dq "....+-+...", 0
    l7 dq ".....++...", 0
    l8 dq ".....+....", 0
    l9 dq "          ", 0
    l10 dq "  +------+", 0
    l11 dq "  +-----+ ", 0
    l12 dq "   +----+ ", 0
    l13 dq "   +---+  ", 0
    l14 dq "    +--+  ", 0
    l15 dq "    +-+   ", 0
    l16 dq "     ++   ", 0
    l17 dq "      +   ", 0
    l18 dq "  +      +", 0
    l19 dq "  +     + ", 0
    l20 dq "   +    + ", 0
    l21 dq "   +   +  ", 0
    l22 dq "    +  +  ", 0
    l23 dq "    + +   ", 0
    l24 dq "     ++   ", 0
    l25 dq "      +   ", 0
    l26 dq "     ", 0
    l27 dq "    ", 0

section .bss
    array resq 8
    input resq 8
     
section .text
    global asm_main
    extern rperm

display:
    enter 0, 0

    mov r9, qword 0
    mov r10, qword 0
    mov r11, qword 0
    mov r12, qword 0
    mov rax, qword 0
    mov rbx, qword 0
    mov rcx, qword 9 ; loop1 counter

    mov r11, qword [rbp + 24] ; pointer to first element of array
    mov r12, qword [rbp + 32] ; number of elements in array, in this case 8

    loop1:
        mov r11, qword [rbp + 24]
        mov r10, qword 0 ; loop2 counter

        loop2:
            mov r9, rcx
            sub r9, qword 1 ; r9 is the level
            mov r11, qword [rbp + 24]
            cmp r9, qword 1
            je leveleq1
            ja levelgre1

            levelbel1:
                mov rax, l26
                call print_string

                mov rax, qword [r11 + r10]
                call print_int

                mov rax, l27
                call print_string

                jmp endofloop2

            leveleq1:
                cmp qword [r11 + r10], qword 8
                je sizeis8a
                cmp qword [r11 + r10], qword 7
                je sizeis7a
                cmp qword [r11 + r10], qword 6
                je sizeis6a
                cmp qword [r11 + r10], qword 5
                je sizeis5a
                cmp qword [r11 + r10], qword 4
                je sizeis4a
                cmp qword [r11 + r10], qword 3
                je sizeis3a
                cmp qword [r11 + r10], qword 2
                je sizeis2a

                sizeis1a:
                    mov rax, l8
                    call print_string
                    jmp endofloop2

                sizeis2a:
                    mov rax, l7
                    call print_string
                    jmp endofloop2
                
                sizeis3a:
                    mov rax, l6
                    call print_string
                    jmp endofloop2
                
                sizeis4a:
                    mov rax, l5
                    call print_string
                    jmp endofloop2
                
                sizeis5a:
                    mov rax, l4
                    call print_string
                    jmp endofloop2
                
                sizeis6a:
                    mov rax, l3
                    call print_string
                    jmp endofloop2
                
                sizeis7a:
                    mov rax, l2
                    call print_string
                    jmp endofloop2
                
                sizeis8a:
                    mov rax, l1
                    call print_string
                    jmp endofloop2
                
            levelgre1:
                cmp qword [r11 + r10], r9
                jb sizeisless
                je sizeisequal

                sizeismore:
                    cmp qword [r11 + r10], qword 8
                    je sizeis8c
                    cmp qword [r11 + r10], qword 7
                    je sizeis7c
                    cmp qword [r11 + r10], qword 6
                    je sizeis6c
                    cmp qword [r11 + r10], qword 5
                    je sizeis5c
                    cmp qword [r11 + r10], qword 4
                    je sizeis4c
                    cmp qword [r11 + r10], qword 3
                    je sizeis3c
                    cmp qword [r11 + r10], qword 2
                    je sizeis2c

                    sizeis1c:
                        mov rax, l25
                        call print_string
                        jmp endofloop2

                    sizeis2c:
                        mov rax, l24
                        call print_string
                        jmp endofloop2
                    
                    sizeis3c:
                        mov rax, l23
                        call print_string
                        jmp endofloop2
                    
                    sizeis4c:
                        mov rax, l22
                        call print_string
                        jmp endofloop2
                    
                    sizeis5c:
                        mov rax, l21
                        call print_string
                        jmp endofloop2
                    
                    sizeis6c:
                        mov rax, l20
                        call print_string
                        jmp endofloop2
                    
                    sizeis7c:
                        mov rax, l19
                        call print_string
                        jmp endofloop2
                    
                    sizeis8c:
                        mov rax, l18
                        call print_string
                        jmp endofloop2

                sizeisequal:
                    cmp qword [r11 + r10], qword 8
                    je sizeis8b
                    cmp qword [r11 + r10], qword 7
                    je sizeis7b
                    cmp qword [r11 + r10], qword 6
                    je sizeis6b
                    cmp qword [r11 + r10], qword 5
                    je sizeis5b
                    cmp qword [r11 + r10], qword 4
                    je sizeis4b
                    cmp qword [r11 + r10], qword 3
                    je sizeis3b
                    cmp qword [r11 + r10], qword 2
                    je sizeis2b

                    sizeis1b:
                        mov rax, l17
                        call print_string
                        jmp endofloop2

                    sizeis2b:
                        mov rax, l16
                        call print_string
                        jmp endofloop2
                    
                    sizeis3b:
                        mov rax, l15
                        call print_string
                        jmp endofloop2
                    
                    sizeis4b:
                        mov rax, l14
                        call print_string
                        jmp endofloop2
                    
                    sizeis5b:
                        mov rax, l13
                        call print_string
                        jmp endofloop2
                    
                    sizeis6b:
                        mov rax, l12
                        call print_string
                        jmp endofloop2
                    
                    sizeis7b:
                        mov rax, l11
                        call print_string
                        jmp endofloop2
                    
                    sizeis8b:
                        mov rax, l10
                        call print_string
                        jmp endofloop2

                sizeisless:
                    mov rax, l9
                    call print_string
                    jmp endofloop2

            endofloop2:
                add r10, qword 8
                cmp r10, qword 64
                jne loop2

        call print_nl
        sub rcx, qword 1
        cmp rcx, qword 0
        jne loop1

display_end:
    leave
    ret
            
asm_main:
    enter 0, 0
    saveregs
   
    mov rdi, array
    mov rsi, qword 8
    call rperm
    mov rdi, array

    while:
        call print_nl
        push rsi
        push rdi
        sub rsp, qword 8
        call display
        add rsp, qword 24

        mov rdi, array
        mov rax, qword 0
        
        call print_nl
        mov rax, imsg
        call print_string
        call print_nl
        
        mov rax, qword 0

        call read_char
        mov qword [input], rax
        cmp qword [input], qword '0'
        je terminate
        call read_char
        mov qword [input + 8], rax
        call read_char
        mov qword [input + 16], rax

        cmp qword [input], qword '1'
        jb redo
        cmp qword [input], qword '8'
        ja redo
        cmp qword [input + 8], qword ','
        jne redo
        cmp qword [input + 16], qword '1'
        jb redo
        cmp qword [input + 16], qword '8'
        ja redo
        cmp rax, qword [input]
        je redo

        mov rax, smsg
        call print_string
        call print_nl

        sub qword [input], qword '0'
        sub qword [input + 16], qword '0'

        mov r14, qword 0
        mov r15, qword 0
        mov r14, qword [input]
        mov r15, qword [input + 16]
        mov rbx, qword 0
        mov rcx, qword 0
        mov rdx, qword 0

        swap:
                cmp r14, qword [rdi + rcx] 
                je firstiseq
                
                cmp r15, qword [rdi + rcx]
                je secondiseq

                jne incrementandcheck

                firstiseq:
                    mov rbx, rcx
                    jmp incrementandcheck

                secondiseq:
                    mov rdx, rcx
            
                incrementandcheck:
                    add rcx, qword 8
                    cmp rcx, qword 64
                    jne swap

        mov r8, qword 0
        mov r9, qword 0
        mov r8, qword [rdi + rbx]
        mov r9, qword [rdi + rdx]
        mov [array + rbx], r9
        mov [array + rdx], r8
        
        mov rdi, array
        mov rax, 0
        mov rcx, 0

        jmp cancelreadcharscanningtwice

        terminate:
            mov rax, 0
            mov rax, tmsg
            call print_string
            call print_nl
            jmp asm_main_end
      
        redo:
            mov rax, 0
            mov rax, rmsg
            call print_string
            call print_nl
            jmp cancelreadcharscanningtwice

        cancelreadcharscanningtwice: ; given read_char does not account for newline being scanned next,
            call read_char           ; so I go here before going back to while or else "If you want to swap..."
            jmp while                ; and redo message will appear twice in total due to \n being auto scanned next loop



asm_main_end:
    restoregs
    leave
    ret
