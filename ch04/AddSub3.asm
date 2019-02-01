TITLE Addition and Subtraction	 (AddSub3.asm)

COMMENT !
    Type in the AddSub3.asm program and get it working.

    Then add something else that is interesting to it.

    Tell me what you added to the program.

    This program will let you experiment with addition, subtraction, increment, decrement and negate commands.

    You can do some more arithmetic in your version of the program.
!

INCLUDE Irvine32.inc

.data
Rval	   SDWORD ?
Xval	   SDWORD 26
Yval	   SDWORD 30
Zval	   SDWORD	40

.code
main PROC
    ; INC and DEC
    mov ax,1000h
    inc ax		; 1001h
    dec ax		; 1000h
    call DumpRegs

    ; Expression: Rval = -Xval + (Yval - Zval)
    mov eax,Xval
    neg eax		; -26
    mov ebx,Yval
    sub ebx,Zval	; -10
    add eax,ebx	
    mov Rval,eax	; -36
    call DumpRegs

    ; Zero flag example
    mov cx,1
    sub cx,1		; ZF = 1
    mov ax, 0FFFFh
    inc ax		; ZF = 1
    call DumpRegs

    ; Sign flag example:
    mov cx,0
    sub cx,1		; SF = 1
    mov ax,7FFFh	; Since 7FFFh will have the MSB higher than 7, it's neg.
    add ax,2		; SF = 1
    call DumpRegs

    ; Carry flag example:
    mov al,0FFh	
    add al,1		; CF = 1, AL = 00
    call DumpRegs

    ; Overflow flag example:
    mov al,+127
    add al,1		; OF = 1
    mov al, -128
    sub al,1		; OF = 1
    call DumpRegs

    ; Extra Work
    mov ax,+65535
    add ax,2
    mov bx,-32768
    sub bx,1
    call DumpRegs


    exit
main ENDP
END main
