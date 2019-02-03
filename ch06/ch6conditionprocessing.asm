TITLE Encryption Program		(Encrypt.asm)

; This program demonstrates simple symmetric
; encryption using the XOR instruction.

INCLUDE Irvine32.inc
KEY = 239			; any value vetween 1-255
BUFMAX = 128		; maximum buffer size

.data
sPrompt		BYTE	"Enter the plain text:	",0
sKeyLength	BYTE	"Please enter text longer than 5 characters:  ",0
sEncrypt	BYTE	"Cipher text:			",0
sDecrypt	BYTE	"Decrypted:				",0
buffer		BYTE	BUFMAX+1 DUP(0)
bufSize		DWORD	?

.code
main PROC
	call	InputTheString		; input the plain text
	call	TranslateBuffer		; ecrypt the buffer
	mov		edx,OFFSET sEncrypt	; display encrypted message
	call	DisplayMessage
	call	TranslateBuffer		; decrypt message
	mov		edx,OFFSET sDecrypt	; display decrypted message
	call	DisplayMessage		

	exit
main ENDP

;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string 
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov		edx,OFFSET sPrompt		; display a prompt
	call	WriteString
	mov		ecx,BUFMAX				; maximum character count
	mov		edx,OFFSET buffer		; point to the buffer
	call	ReadString				; input the string goes into EAX
lengthCheck:
	cmp		eax,5
	jg		continue
	mov		edx,OFFSET sKeyLength	; display a prompt
	call	WriteString
	mov		ecx,BUFMAX				; maximum character count
	mov		edx,OFFSET buffer		; point to the buffer	
	call	ReadString				; input the string goes into EAX	
	jmp		lengthCheck
continue:
	mov		bufSize,eax				; save the length
	call	Crlf
	popad
	ret
InputTheString ENDP

;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov		ecx,bufSize				; loop counter
	mov		esi,0					; index 0 in buffer
L1:
	xor		buffer[esi],KEY			; translate a byte
	inc		esi						; point to next byte
	loop	L1
	popad
	ret
TranslateBuffer ENDP

;-----------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns:  nothing
;-----------------------------------------------------
	pushad
	call	WriteString				; Reads message from edx that comes from main routine
	mov		edx,OFFSET buffer		; display the buffer message
	call	WriteString				; edx gets changed to message from buffer
	call	Crlf
	call	Crlf
	popad
	ret

DisplayMessage ENDP

END main