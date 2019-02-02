TITLE Random Integers	 (Procedures.asm)

COMMENT !
    There are four small programs in this chapter.

    They are TestLib1.asm (integer I/O), TestLib2.asm (random integers), TestLib3.asm (performance timing), and RevStr.asm (reversing a string).

    Type in one of these programs. 

    After you get it working, add some more statements.

    Tell me what you added.
!

INCLUDE Irvine32.inc

.data
TAB = 9			    ; ASCII code for Tab
buffer BYTE 21 DUP(0)   ; input buffer
byteCount DWORD ?	    ; holds counter
prompt BYTE "What is your name: ",0
name BYTE ?

.code
main PROC
    call Randomize	    ; init random generator
    call Rand1
    call Rand2
    call Rand3

    exit
main ENDP

Rand1 PROC
; Generate ten pseudo-random integers
    mov ecx,10		; loop 10 times

L1: call	  Random32    ; generate random int
    call	  WriteDec    ; write in unsigned decimal
    mov	  al,TAB	    ; horizontal tab
    call	  WriteChar   ; write the tab
    loop L1
    call Crlf
    ret
Rand1 ENDP

Rand2 PROC
; Generate ten pseudo-random integers from -50 to +49
    mov	  ecx,10	    ; loop 10 times

L1: mov	  eax,100	    ; values 0-99
    call	  RandomRange ; generate random int
    sub	  eax,50	    ; values -50 to +49
    call	  WriteInt    ; write signed decimal
    mov	  al,TAB	    ; horizontal tab
    call	  WriteChar   ; write the tab
    loop L1

    call Crlf
    ret
Rand2 ENDP

Rand3 PROC
; Change Window Color
    mov	  eax,yellow + (blue * 16)
    call	  SetTextColor

; Show popup window to ask for name
    mov	  edx,OFFSET prompt
    call	  WriteString

; User enters and eax displays number of bits in head on AL
    mov	  edx,OFFSET buffer
    mov	  ecx,SIZEOF buffer
    call	  ReadString
    mov	  byteCount,eax

    call DumpRegs


Rand3 ENDP

	  
END main
