section .data
    num dd -76.0625  ; the floating-point number to convert

section .text
    global _start
    _start:
        ; Load the number into the FPU (Floating Point Unit)
        fld dword [num]

        ; Perform IEEE 754 conversion (use FPU instructions)
        ; To output or further manipulate, use system calls or direct memory access

        ; Exit the program
        mov eax, 1      ; syscall number for exit
        xor ebx, ebx    ; exit status 0
        int 0x80
