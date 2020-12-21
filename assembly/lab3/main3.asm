INCLUDE Irvine32.inc

.data
buffer BYTE 16 DUP(?)				; main buffer for strings

.code
; ##### ##### #####
Str_lcase PROC USES eax esi,		; reworked Str_ucase from Irvine32
	pString:PTR BYTE

	mov esi, pString
L1:
	mov al, [esi]					; get char
	cmp al, 0						; end of string?
	je  L3							; if yes then quit
	cmp al, 'A'						; below "A"? = 41h, 65d
	jb  L2
	cmp al, 'Z'						; above "Z"? = 5Ah, 90d
	ja  L2
	or BYTE PTR [esi], 00100000b	; convert the char

L2:	
	inc esi							; next char
	jmp L1

L3: 
	ret
Str_lcase ENDP

; ##### ##### #####
Str_reverse PROC USES esi edi,		; str reverse function
	pString:PTR BYTE

    mov     esi, pString			; both esi & edi point to the start of a string
    mov     edi, pString
    dec     edi
find_end:							; finds the end index of a string
    inc     edi						; advance end pointer
    mov     al, [edi]				; look for end of string
    cmp     al, 0					; if char is null term then
    jnz     find_end				; false: move to next char 
    dec     edi						; true: --edi to last char

swap_loop:
    cmp     esi, edi				; if start >= end, then we are finished
    jae     finish

    mov     bl, [esi]				; swap characters
    mov     al, [edi]
    mov     [esi], al
    mov     [edi], bl

    inc     esi						; move pointers toward each other
    dec     edi
    jmp     swap_loop

finish:
	ret
Str_reverse ENDP

; ##### ##### #####
main PROC							; MAIN FUNC
									; str input
	mov edx, OFFSET buffer			; str addr offset to edx
	mov ecx, (SIZEOF buffer) - 1	; str buffer size to ecx
	call ReadString					; reading string from stdin

	invoke Str_lcase, ADDR buffer	; str to lowercase
	invoke Str_reverse, ADDR buffer ; str reversing

									; str out
	mov edx, OFFSET buffer			; str offset to edx
	call WriteString				; str to stdout?
	call Crlf						; car return, line feed
	call WaitMsg					; press any key

	exit
main ENDP
END main

