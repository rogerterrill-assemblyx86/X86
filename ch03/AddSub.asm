TITLE Add and Subtract	   (AddSub.asm)

; This program adds and subtracts 23-bit integers.

INCLUDE Irvine32.inc

.code
main PROC

    mov	  eax,10000h	   ; EAX = 10000h
    add	  eax,40000h	   ;	EAX = 50000h
    sub	  eax,20000h	   ; EAX = 30000h

    mov	  ebx,11000h	   ; EAX = 11000h
    add	  ebx,40000h	   ;	EAX = 51000h
    sub	  ebx,20000h	   ; EAX = 31000h

    mov	  ecx,12000h	   ; EAX = 12000h
    add	  ecx,40000h	   ;	EAX = 52000h
    sub	  ecx,20000h	   ; EAX = 32000h

    mov	  edx,13000h	   ; EAX = 13000h
    add	  edx,40000h	   ;	EAX = 53000h
    sub	  edx,20000h	   ; EAX = 33000h

    call	  DumpRegs

    exit
main ENDP
END main