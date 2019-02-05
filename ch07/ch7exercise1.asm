TITLE Binary to ASCII		(ch7exercies1.asm)

COMMENT ! 
    This chapter explains how to perform shift and rotate operations and how to carry out efficient integer and division using shift operations.

    There are several small programs or procedures in this chapter such as BinToAsc.asm, mult_by_shifting, and Extended_add procs.

    Pick a couple of them and write the main part of a program and test them out.
    Add something interesting to the programs.

    Tell me exactly which ones you are doing and provide the programs and the output in your Submission.
!

INCLUDE Irvine32.inc


.data

binVal	  DWORD	?
buffer	  BYTE	32 dup(0)
hexVal	  DWORD	?
prompt	  BYTE	"Please enter a 32 bit hex value: ",0
response	  BYTE	"Your ASCII binary is multiplied by 10 is: ",0dh,0ah,0
val3		  SDWORD ?


.code
main PROC

    mov	  edx,OFFSET prompt
    call	  WriteString

    call	  ReadHex
    mov	  ebx,10
    mul	  ebx
    mov	  esi,OFFSET buffer		 ; point to the buffer
    call	  BinToAsc			 ; Do the conversion



    mov	  edx,OFFSET response
    call	  WriteString

    mov	  edx,OFFSET buffer
    call	  WriteString

    call	  Crlf
    call	  Crlf

    

    exit

main ENDP

;---------------------------------------------------------
; BinToAsc PROC
;
; Converts 32-bit binary integer to ASCII binary.
; Receives: EAX = binary integer, ESI points to buffer
; Returns: buffer filled with ASCII binary digits
;---------------------------------------------------------

BinToAsc PROC
    push	  ecx
    push	  esi
    mov	  ecx,32
L1: shl	  eax,1
    mov	  BYTE PTR [esi],'0'
    jnc	  L2
    mov	  BYTE PTR [esi],'1'
L2: inc	  esi
    loop	  L1
    pop	  esi
    pop	  ecx
    ret
BinToAsc ENDP

END main