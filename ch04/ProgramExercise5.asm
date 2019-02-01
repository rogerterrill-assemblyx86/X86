TITLE Programming Exercises #1	 (ProgramExercise1.asm)

COMMENT !
    7. Arithmetic Expression
    Write a program that implements the following arithmetic expression:
    EAX = -val2 + 7 - val3 + val1

    Use the following data definitions:
    val1 SDWORD 8
    val2 SDWORD -15
    val3 SDWORD 20

    In comments next to each instruction, write the hexadecimal value of EAX. Insert a call
    DumpRegs statement at the end of the program.
!

INCLUDE Irvine32.inc

.data
val1 SDWORD 8
val2 SDWORD -15
val3 SDWORD 20

.code
main PROC
    ; Expression: EAX = -val2 + 7 - val3 + val1

    ; mov val2 into the eax register
    mov eax,val2	    ; EAX = FFFFFFF1

    ; negate the value at eax
    neg eax		    ; EAX = 0000000F

    ; add 7 to the eax value
    add eax,7		    ; EAX = 00000016

    ; add val1 to eax
    add eax,val1	    ; EAX = 0000001E 

    ; subtract val3 from EAX
    sub eax,val3	    ; EAX = 0000000A

    call DumpRegs

    exit
main ENDP
END main
