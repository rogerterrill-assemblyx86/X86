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
prompt	BYTE	"Please type in a number between 1-200: ",0

.code
main PROC
	mov	edx,OFFSET prompt
	call WriteString
	call ReadInt

	.WHILE eax > val1
		call	WriteDec
		DEC		eax
		mov		val2,eax
		mov		eax,50
		call	Delay
		mov		eax,val2
		call	Crlf
	.ENDW

	exit
main ENDP

END main