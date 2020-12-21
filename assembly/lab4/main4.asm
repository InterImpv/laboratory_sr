.386
.model flat, stdcall
.stack 4096

INCLUDE Irvine32.inc
ExitProcess PROTO, dwExitCode:DWORD

.data
lopBuf BYTE 6 DUP(?)                    ; left-hand operand
ropBuf BYTE 6 DUP(?)                    ; right-hand operand

ascii_num BYTE 30h                      ; constant for ascii based arithmetic

.code
; *****************************************************************************
;   Str_moveptr -> move string pointer N places
;       requires:
;           ecx    -> N
;           strPtr -> target string pointer
;       returns:
;           pointer to the string element (esi)

Str_moveptr PROC USES ecx,
    strPtr:PTR BYTE

    mov esi, strPtr                     ; get string start address

move_place:                             ; loop N times incrementing the pointer
    inc esi
    loop move_place

    ret

Str_moveptr ENDP
; *****************************************************************************

; *****************************************************************************
;   ASCII_sub -> ascii subtraction
;       requires:
;           lop -> left-hand operand  (minuend)
;           rop -> right-hand operand (subtrahend)
;       returns:
;           subtraction result, written into lop

ASCII_sub PROC USES eax ebx edx esi edi,
	lop:PTR BYTE,
	rop:PTR BYTE,
    opSize: BYTE

    mov edx, lop                        ; mov lop start address for checking pointers

    mov ecx, DWORD PTR opSize           ; string size to move string pointers to the end
    invoke Str_moveptr, rop             ; move esi to the end of rop
    mov edi, esi                        ; copy esi into edi to point into rop
    invoke Str_moveptr, lop             ; move esi to the end of lop

    xor eax, eax                        ; not really required, but we make sure
    pushfd

sub_loop:
    cmp esi, edx                        ; check if end is reached
    jb prepare                          ; if yes -> start preparing the result

    mov al, BYTE PTR [esi]              ; move left-hand ascii-char into al
    mov bl, BYTE PTR [edi]              ; move right-hand ascii-char into ab

    popfd                               ; get flags back
    sbb al, bl                          ; subract
    aas                                 ; adjust
    pushfd                              ; save flag states onto stack

next_char:                              ; get next character
    mov [esi], al                       ; write the result back

    dec esi                             ; decrement pointers
    dec edi
    jmp sub_loop                        ; loop back

prepare:
    popfd                               ; if carry -> the result is negative
    jnc resp_out                        ; check whether positive, if yes skip conversion

    mov al, '-'                         ; if not, place '-' before the result
    call WriteChar
    invoke Str_moveptr, lop             ; move pointer to the end

    popfd                               ; <- this can be a problem

convert:                                ; if result is negative then do (10^N - result[N-1, 0]) to get true value
    pushfd                              ; again -> done to save the flag states
    cmp esi, edx                        ; check if end is reached
    jb resp_out                         ; if yes -> string is ready to become ascii again
    popfd

    mov al, 00h                         ; do the (10[i] - result[i])

    sbb al, [esi]                       ; subtract
    aas                                 ; adjust
    mov [esi], al                       ; write back

    dec esi
    jmp convert
    
resp_out:
    invoke Str_moveptr, lop              ; move pointer to the end

make_ascii:
    cmp esi, edx                        ; check if end is reached
    jb finish                           ; saving flag states is pointless here, finally

    mov al, BYTE PTR [esi]              ; get value
    
    or al, ascii_num                    ; make ascii char
    mov [esi], al                       ; write back
    dec esi
    jmp make_ascii

finish:
	ret
ASCII_sub ENDP
; *****************************************************************************

main PROC
        ; get left-hand operand
    mov edx, OFFSET lopBuf
    mov ecx, SIZEOF lopBuf
    call ReadString

        ; get right-hand operand
    mov edx, OFFSET ropBuf
    mov ecx, SIZEOF ropBuf
    call ReadString

        ; subtract rop from lop saving result in lop
    invoke ASCII_sub, ADDR lopBuf, ADDR ropBuf, (SIZEOF lopBuf - 2)

    mov edx, OFFSET lopBuf
    call WriteString
    call Crlf
        
        ; end
    call WaitMsg

    invoke ExitProcess, 0

main ENDP
END main