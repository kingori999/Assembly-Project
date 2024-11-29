section .data
    a dd 5          ; example value for a
    b dd 3          ; example value for b
    result dd 0     ; to store the result of a! - b!

section .text
    global _start
    _start:
        ; Compute a! and store it in eax
        mov eax, [a]
        call factorial
        mov ebx, eax  ; store a! in ebx

        ; Compute b! and store it in eax
        mov eax, [b]
        call factorial
        sub ebx, eax  ; subtract b! from a!

        ; Store the result in memory
        mov [result], ebx

        ; Exit the program
        mov eax, 1
        xor ebx, ebx
        int 0x80

    factorial:
        ; This is a simple recursive factorial function
        cmp eax, 1
        jle .done
        push eax
        dec eax
        call factorial
        pop ebx
        imul eax, ebx
        ret
    .done:
        mov eax, 1
        ret
