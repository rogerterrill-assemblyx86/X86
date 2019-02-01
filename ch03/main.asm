TITLE Data Transfer Examples		 (Moves.asm)

COMMENT !
    There is a great deal of important material here to get you 
    started programming in assembly language, so you will need to spend some time on it.

    Type in the Moves.asm program and get it working.

    You can type in part of the program and then assemble it, 
    as long as you have the last 3 lines in the program.

    That is, you can type the first MOVZX section, and assemble it, 
    to see how it works, as long as you have the "EXIT, main ENDP, 
    END main" lines at the end of the programs.

    After you get the program in and working, add something else 
    that is interesting to it.

    Tell me what you added to the program.

    You will need to go back to section 2.2 that discusses the different 
    registers: eax, ebx, ..., ax, al, etc.
!

INCLUDE Irvine32.inc

.data
val1 WORD 1000h
val2 WORD 2000h
arrayB BYTE 10h,20h,33h,40h,50h
arrayW WORD 100h,200h,300h
arrayD DWORD 10000h,20000h, 30000h

.code
main PROC

; Demontrating MOVZX instruction:
    mov	  bx,0A69Bh
    movzx	  eax,bx		   ; EAX = 0000A69Bh
    movzx	  edx,bl		   ; EDX = 0000009Bh
    movzx	  cx,bl		   ; CX = 009Bh
    call DumpRegs

; Demonstrating MOVSX instruction:
    mov	  bx,0A69Bh   
    movsx	  eax,bx		   ; EAX = FFFFA69Bh
    movsx	  edx,bl		   ; EDX = FFFFFF9Bh
    mov	  bl,7Bh	    
    movsx	  cx,bl		   ; CX = 007Bh
    call DumpRegs

; Memory-to-memory exchange:
    mov	  ax,val1		   ; AX = 1000h
    xchg	  ax,val2		   ; AX = 2000h, val2 = 1000h
    mov	  val1,ax		   ; val1 = 2000h
    call DumpRegs

; Direct-Offset Addressing (byte array):
    mov	  al,arrayB	   ; AL = 10h
    mov	  al,[arrayB+1]   ; AL = 20h
    mov	  al,[arrayB+2]   ; AL = 30h
    call DumpRegs

; Direct-Offset Addressing (word array):
    mov	  ax,arrayW	   ; AX = 100h
    mov	  ax,[arrayW+2]   ; AX = 200h
    call DumpRegs

; Direct-Offset Addressing (doubleword array):
    mov	  eax,arrayD	   ; EAX = 10000h
    mov	  eax,[arrayD+4]  ; EAX = 20000h
    mov	  eax,[arrayD+8]  ; EAX = 30000h
    call DumpRegs

; Extra changes
    mov	  dx,[arrayW+2]   ; EDX = 200h
    mov	  val1,dx	   
    mov	  cx,val1		   ; ECX = 200h


    call DumpRegs

    exit
main ENDP
END main
