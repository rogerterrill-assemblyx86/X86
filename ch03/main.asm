TITLE Data Definitions	   (AddSub.asm)

COMMENT ! 2. Data Definitions
    Write a program that contains a definition of each data type listed in Table 3-2 in Section 3.4.
    Initialize each variable to a value that is consistent with its data type.
!

INCLUDE Irvine32.inc


.data

val1 BYTE 'A'
val2 SBYTE -128
val3 WORD 0FFFFh
val4 SWORD 8402h
val5 DWORD 0FFFFFFFFh
val6 SDWORD -80000000h
val7 FWORD 281474976710655
val8 QWORD 1234567812345678h
val9 TBYTE 1208925819614629174706175
val10 REAL4 -1.2
val11 REAL8 3.2E-260
val12 REAL10 4.6E+4096

.code
main PROC


    exit
main ENDP
END main