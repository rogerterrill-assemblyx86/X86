TITLE ASCII Addition		(ch7exercies2.asm)

COMMENT ! 
    10. Display ASCII Decimal
	Write a procedure named WriteScaled that outputs a decimal ASCII number with an implied decimal
	point. Suppose the following number were defined as follows, where DECIMAL_OFFSET
	indicates that the decimal point must be inserted five positions from the right side of the number:
	DECIMAL_OFFSET = 5
	.data
	decimal_one BYTE "100123456789765"
	WriteScaled would display the number like this:
	1001234567.89765
	When calling WriteScaled, pass the number’s offset in EDX, the number length in ECX, and the
	decimal offset in EBX. Write a test program that displays three numbers of different sizes.
!

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5						; offset from right of string
.data
decimal_one BYTE "100123456789765"			; 1001234567.89765

buffer BYTE (SIZEOF decimal_one + 1) DUP(0),0

.code
main PROC

; Start at the last digit position.

	mov esi,0	; position index
	mov	ecx,SIZEOF decimal_one		; Number length
	mov edx,OFFSET decimal_one		; Offset of number	
	mov ebx,DECIMAL_OFFSET			; Number Offset
	sub ebx,ecx
	neg ebx

	Call WriteScaled
	
	exit
main ENDP

writeScaled PROC
L1:
	.IF(esi == ebx)
		mov al,'.'
		call WriteChar
	.ENDIF
	mov al,decimal_one[esi]
	
	call WriteChar
	inc esi
	loop L1

	
	call Crlf


writeScaled ENDP

END main