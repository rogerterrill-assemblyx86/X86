TITLE Subtracting Three Integers	   (AddSub.asm)

COMMENT ! 
    place 1 in ecx register
    place 3 in edx register
    add ecx and edx registers and place result in ecx.
    subtract edx from ecx and place result in ebx.

    move 10 to eax

    Display results in register.
!

INCLUDE Irvine32.inc

.code
main PROC

    mov	  ecx,1		   ; ECX = 1
    mov	  edx,3		   ;	EDX = 3
    add	  ecx,edx		   ; ECX = 4
    sub	  ecx, edx	   ; ECX = 1
    mov	  ebx, ecx	   ; EBX = 1
    mov	  eax, 10		   ; EAX = 10



    call	  DumpRegs

    exit
main ENDP
END main 