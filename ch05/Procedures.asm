TITLE Procedures	 (Procedures.asm)

COMMENT !
    In this chapter you will learn how input-output is handled in MS-Windows protected mode.
    And you will write programs that use and call procedures.
    Procedures are similar to functions or subroutines in other languages.
    In the beginning of this chapter there are several little program fragments.
    Type a few of them in and test them out.
    You can put them all in one program.
!

INCLUDE Irvine32.inc

.data
filename BYTE "newfile.txt",0

array DWORD 1,2,3,4,5,6,7,8,9,0Ah,0Bh

rows BYTE ?
cols BYTE ?

startTime DWORD ?

color BYTE ?

validDecimal BYTE 5

caption	  db "Dialog Title Test", 0
HelloMsg	  BYTE "This is a popup message box test", 0dh,0ah
		  BYTE "Click the OK Button to continue..."

caption2	  BYTE "Survey Completed",0
question	  BYTE "Thank you for completing the survey"
		  BYTE 0dh,0ah	   ; This is the end line character
		  BYTE "Would you like to receive the results?",0

buffer BYTE "255"
bufsize = ($ - buffer)

intVal DWORD ?

.code
main PROC

    ; Successfully created the newfile.txt in project folder
    mov edx,OFFSET filename
    call CreateOutputFile

    mov esi,OFFSET array
    mov ecx,LENGTHOF array
    mov ebx,TYPE array
    call DumpMem

    call GetMaxXY
    mov rows, al
    mov cols,dl

    call GetMseconds
    mov startTime,eax
    L1:
	   ; (loop body)
    loop L1
    call GetMseconds
    sub eax,startTime

    call GetTextColor
    mov color,AL

    mov dh,20	 ; This pushed down the DumpRegs
    mov dl,20
    call Gotoxy

    mov al,validDecimal
    call IsDigit

    mov ebx,OFFSET caption
    mov edx,OFFSET HelloMsg
    call MsgBox

    mov ebx,OFFSET caption2
    mov edx,OFFSET question
    call MsgBoxAsk
    ;(check return value in EAX)

    mov edx,OFFSET buffer
    mov ecx,bufSize
    call ParseDecimal32

    call Randomize
    mov ecx,10
    Loop1: call Random32
	   	 ;call DumpRegs
	   loop Loop1

    call ReadDec
    mov intVal,eax

    call DumpRegs
    exit
main ENDP
END main
