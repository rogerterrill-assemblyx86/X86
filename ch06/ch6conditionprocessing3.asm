TITLE Countdown		(ch6conditionprocessing2.asm)

COMMENT !
	There are several program fragments or complete programs in the rest of the chapter.

	Pick one of them and type it in and get it working.

	After you get the program in and working, add something else that is interesting to it.

	Tell me what you added to the program.
!

; Counts down from number inputed with a while conditional

INCLUDE Irvine32.inc

.data
val1	DWORD	?
val2	DWORD	?
prompt	BYTE	"Please type in a score between 0-100: ",0

msgA	BYTE	"You got an A",0
msgB	BYTE	"You got a B",0
msgC	BYTE	"You got a C",0
msgD	BYTE	"You got a D",0
msgF	BYTE	"You got a F",0

.code
main PROC
	mov	edx,OFFSET prompt
	call WriteString
	call ReadInt

	.IF (eax >= 90) && (eax <= 100) 
		mov edx, OFFSET msgA
		call WriteString
		call	Crlf
	.ELSEIF (eax >= 80) && (eax <= 89) 
		mov edx, OFFSET msgB
		call WriteString
		call	Crlf
	.ELSEIF (eax >= 70) && (eax <= 79) 
		mov edx, OFFSET msgC
		call WriteString
		call	Crlf
	.ELSEIF (eax >= 60) && (eax <= 69) 
		mov edx, OFFSET msgD
		call WriteString
		call	Crlf
	.ELSEIF (eax >= 0) && (eax <= 59) 
		mov edx, OFFSET msgF
		call WriteString
		call	Crlf
	.ENDIF

	exit
main ENDP

END main