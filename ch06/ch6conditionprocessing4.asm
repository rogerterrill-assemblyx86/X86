TITLE Boolean Calculator		(ch6conditionprocessing4.asm)

COMMENT !
	Create a program that functions as a simple boolean calculator for 32-bit integers. It should display
	a menu that asks the user to make a selection from the following list:
	1. x AND y
	2. x OR y
	3. NOT x
	4. x XOR y
	5. Exit program
	When the user makes a choice, call a procedure that displays the name of the operation about to
	be performed. (We will implement the operations in the exercise following this one.)
!

INCLUDE Irvine32.inc

.data
val1	DWORD	?
val2	DWORD	?
prompt	BYTE	"Please choose a boolean conditional: ",0dh,0ah,0

msgA	BYTE	"(1) x AND y",0dh,0ah,0
msgB	BYTE	"(2) x OR y",0dh,0ah,0
msgC	BYTE	"(3) NOT x",0dh,0ah,0
msgD	BYTE	"(4) x XOR y",0dh,0ah,0
msgF	BYTE	"(5) Exit Program",0dh,0ah,0

.code
main PROC
	mov	edx,OFFSET prompt
	call WriteString
	mov	edx,OFFSET msgA
	call WriteString
	mov	edx,OFFSET msgB
	call WriteString
	mov	edx,OFFSET msgC
	call WriteString
	mov	edx,OFFSET msgD
	call WriteString
	mov	edx,OFFSET msgF
	call WriteString

	call ReadInt

	.IF eax == 1
		mov edx, OFFSET msgA
		call WriteString
		call	Crlf
	.ELSEIF eax == 2
		mov edx, OFFSET msgB
		call WriteString
		call	Crlf
	.ELSEIF eax == 3 
		mov edx, OFFSET msgC
		call WriteString
		call	Crlf
	.ELSEIF eax == 4
		mov edx, OFFSET msgD
		call WriteString
		call	Crlf
	.ELSEIF eax == 5
		mov edx, OFFSET msgF
		call WriteString
		call	Crlf
		exit
	.ENDIF

main ENDP

END main