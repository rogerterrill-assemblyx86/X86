TITLE ASCII Addition		(ch7exercies2.asm)

COMMENT ! 
    This chapter explains how to perform shift and rotate operations and how to carry out efficient integer and division using shift operations.

    There are several small programs or procedures in this chapter such as BinToAsc.asm, mult_by_shifting, and Extended_add procs.

    Pick a couple of them and write the main part of a program and test them out.
    Add something interesting to the programs.

    Tell me exactly which ones you are doing and provide the programs and the output in your Submission.
!

INCLUDE Irvine32.inc

DECIMAL_OFFSET = 5
.data
decimal_one BYTE "100123456789765"
decimal_two BYTE "900402076502015"
sum BYTE (SIZEOF decimal_one + 1) DUP(0),0
buffer  BYTE	 20 DUP(0)

.code
main PROC

; Start at the last digit position.
    mov	  esi,SIZEOF  decimal_one-1
    mov	  edi,SIZEOF  decimal_one
    mov	  ecx,SIZEOF  decimal_one
    mov	  bh,0					; set carry value to zero

L1: mov	  ah,0					; clear AH before addition
    mov	  al,decimal_one[esi]		; get the first digit
    add	  al,bh					; add the previous carry
    aaa							; adjust the sum (AH = carry)
    mov	  bh,ah					; save the carry in carry1
    or	  bh,30h					; convert it to ASCII
    add	  al,decimal_two[esi]		; add the second digit
    aaa							; adjust the sum (AH = carry)
    or	  bh,ah					; OR the carry with carry1
    or	  bh,30h					; convert it to ASCII
    or	  al,30h					; convert AL back to ASCII
    mov	  sum[edi],al				; save it in the sum
    dec	  esi					; back up one digit
    dec	  edi
    loop	  L1
    mov	  sum[edi],bh				; save last carry digit

; Display the sum as a string
    mov	  edx,OFFSET sum
    call	  WriteString
    call	  Crlf
    exit

main ENDP


END main