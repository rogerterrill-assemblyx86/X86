TITLE Encryption Program		(Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc

.data
ranNum DWORD ?

.code
main PROC
	mov eax,100
	call RandomRange
	mov ranNum, eax
	mov eax, ranNum
	call WriteInt
	call Crlf

	exit
main ENDP

END main