TITLE Random Screen Locations	 (ProgramCH5EX7.asm)

COMMENT !
    7. Random Screen Locations
	Write a program that displays a single character at 100 random screen locations, using a timing
	delay of 100 milliseconds. Hint: Use the GetMaxXY procedure to determine the current size of
	the console window.
!

INCLUDE Irvine32.inc

.data
rows WORD ?
cols WORD ?

.code
main PROC

; Loop counter
	mov		ecx,100

top:
; Get size of window
	call GetMaxXy		; Get size of window
	mov rows,ax			; Save value x to rows variable
	mov cols,dx			; Save value y to cols variable


; Set Cursor
	movzx eax,rows		; EAX is 32 bit, Rows is 16 Bit so have to fill in 
	call RandomRange	; Pushes random int in range to al
	mov dh,al			; al is pushed to dh since Gotoxy looks at dh for row
	
	movzx eax, cols		; EAX is 32 bit, Rows is 16 Bit so have to fill in 
	call RandomRange	; Pushes random int in range to al
	mov dl,al			; al is pushed into dl since Gotoxy looks at dl for column

	call Gotoxy			; Changes the location of cursor

; Write out Character

	mov al,'A'			; Push character of A to al
	call WriteChar		; Write out the character

; Delay 100ms
	mov eax,100			; Push 100 to eax for 100 milliseconds
	call Delay			; Delay is called


	loop top
	exit
main ENDP

	  
END main
