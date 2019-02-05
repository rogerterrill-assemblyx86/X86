TITLE ASCII Addition		(ch7exercies2.asm)

COMMENT ! 
    Chapter 7: Integer Arithmetic 

	Type in the ASCII_add.asm program (or another program) and get it working.

	After you get the program in and working, add something else that is interesting to it.

	Tell me what you added to the program.
!

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5
.data
decimal_one BYTE "20"
decimal_two BYTE "10"
sum BYTE (SIZEOF decimal_one + 1) DUP(0),0
dif	BYTE (SIZEOF decimal_one + 1) DUP(0),0
buffer  BYTE	 20 DUP(0)

sumPrompt	BYTE	"The sum is:  ",0
diffPrompt	BYTE	"The difference is:  ",0

.code
main PROC

; Start at the last digit position.
    mov	  esi,SIZEOF  decimal_one-1
    mov	  edi,SIZEOF  decimal_one
    mov	  ecx,SIZEOF  decimal_one
    mov	  bh,0						; set carry value to zero

L1: mov	  ah,0						; clear AH before addition
    mov	  al,decimal_one[esi]		; get the first digit
    add	  al,bh						; add the previous carry
    aaa								; adjust the sum (AH = carry)
    mov	  bh,ah						; save the carry in carry1
    or	  bh,30h					; convert it to ASCII
    add	  al,decimal_two[esi]		; add the second digit
    aaa								; adjust the sum (AH = carry)
    or	  bh,ah						; OR the carry with carry1
    or	  bh,30h					; convert it to ASCII
    or	  al,30h					; convert AL back to ASCII
    mov	  sum[edi],al				; save it in the sum
    dec	  esi						; back up one digit
    dec	  edi
    loop	L1
    mov	  sum[edi],bh				; save last carry digit

; Display the sum as a string
	mov		edx,OFFSET sumPrompt
	call		WriteString
    mov		edx,OFFSET sum
    call	  WriteString
    call	  Crlf
    
	mov	  esi,SIZEOF  decimal_one-1
    mov	  edi,SIZEOF  decimal_one
    mov	  ecx,SIZEOF  decimal_one

L2: mov	  ah,0						; clear AH before addition
    mov	  al,decimal_one[esi]		; get the first digit
    sub	  al,bh						; add the previous carry
    aas								; adjust the sum (AH = carry)
    mov	  bh,ah						; save the carry in carry1
    or	  bh,30h					; convert it to ASCII
    sub	  al,decimal_two[esi]		; add the second digit
    aas								; adjust the sum (AH = carry)
    or	  bh,ah						; OR the carry with carry1
    or	  bh,30h					; convert it to ASCII
    or	  al,30h					; convert AL back to ASCII
    mov	  dif[edi],al				; save it in the sum
    dec	  esi						; back up one digit
    dec	  edi
    loop	L2
    mov	  dif[edi],bh				; save last carry digit

	mov		edx,OFFSET diffPrompt
	call		WriteString
	mov		edx,OFFSET dif
    call	  WriteString
    call	  Crlf

	exit
main ENDP


END main