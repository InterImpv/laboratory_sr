.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
        xor ax, ax
        mov al, 14h
        add ax, 9667h
        mov bx, ax
        add eax, ebx
        sub ax, bx

        invoke ExitProcess, 0
main ENDP

END main