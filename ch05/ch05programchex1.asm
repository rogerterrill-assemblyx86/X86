TITLE Draw Text Colors	 (ProgramCH5EX1.asm)

COMMENT !
    1. Draw Text Colors
	Write a program that displays the same string in four different colors, using a loop. Call the Set-
	TextColor procedure from the book’s link library. Any colors may be chosen, but you may find
	it easiest to change the foreground color.
!

INCLUDE Irvine32.inc

.data
prompt BYTE "Hello this is assembly in all colors", 0dh,0ah


.code
main PROC
	mov		ecx,4
	mov		eax, green + (white * 16)
top:
	
	inc		eax
	call	SetTextColor
	mov		edx,OFFSET prompt
    call	WriteString
	loop top
	exit
main ENDP

	  
END main
