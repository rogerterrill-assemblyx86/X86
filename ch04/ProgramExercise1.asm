TITLE Programming Exercises #1	 (ProgramExercise1.asm)

COMMENT !
    1. Carry Flag
    Write a program that uses addition and subtraction to set and clear the Carry flag. After each
    instruction, insert the call DumpRegs statement to display the registers and flags. Using comments,
    explain how (and why) the Carry flag was affected by each instruction.
!

INCLUDE Irvine32.inc

.data


.code
main PROC
    ; Set 255, the max value to an 8-bit register
    mov al,+255		   ; AL = FF, CF = 0
    call DumpRegs

    ; Add 1 to go over the max val for 8bits and set CF = 1
    add al,1			   ; AL = 00, CF = 1
    call DumpRegs

    ; Subtracting 1 from 00, which lower from higher always sets CF = 1
    sub al,1			   ; AL = FF, CF = 1
    call DumpRegs

    ; Subtracting 1 from FF, clears the CF
    sub al,1			   ; AL = FE, CF = 0
    call DumpRegs

    exit
main ENDP
END main
