TITLE Subtracting Three Integers	   (AddSub.asm)

COMMENT ! 1. Subtracting Three Integers
    Using the AddSub program from Section 3.2 as a reference, write a program that subtracts three
    integers using only 16-bit registers. Insert a call DumpRegs statement to display the register
    values.
!

INCLUDE Irvine32.inc

.code
main PROC

    mov	  ax,9000h	   ; AX = 9000h
    sub	  ax,4000h	   ;	AX = 5000h
    sub	  ax,2000h	   ; AX = 3000h

    mov	  bx,9000h	   ; BX = 9000h
    sub	  bx,4000h	   ;	BX = 5000h
    sub	  bx,2000h	   ; BX = 3000h

    mov	  cx,9000h	   ; CX = 9000h
    sub	  cx,4000h	   ;	CX = 5000h
    sub	  cx,2000h	   ; CX = 3000h

    mov	  dx,9000h	   ; DX = 9000h
    sub	  dx,4000h	   ;	DX = 5000h
    sub	  dx,2000h	   ; DX = 3000h

    call	  DumpRegs

    exit
main ENDP
END main