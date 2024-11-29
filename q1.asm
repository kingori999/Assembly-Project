section .data
    result dd 0  ; reserve space for result

section .text
    global _start
    _start:
        ; Push multiplicand and multiplier to the stack
        push 5          ; multiplicand
        push 10         ; multiplier

        ; Call multiplication subroutine
        call multiply

        ; Exit the program
        mov eax, 1      ; syscall number for exit
        xor ebx, ebx    ; exit status 0
        int 0x80

    multiply:
        ; Retrieve multiplicand and multiplier from stack
        pop eax         ; eax = multiplicand
        pop ebx         ; ebx = multiplier

        ; Perform the multiplication
        mul ebx         ; result is in edx:eax (32-bit result)

        ; Store result in memory (result buffer)
        mov [result], eax
        ret
