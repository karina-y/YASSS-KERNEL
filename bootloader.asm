BITS 16
[ORG 0x7c00]

CLI			;disable interrupts
CLD			;clear direction flags
XOR AX, AX		;checks a !== b
			;if === AX is set to 0
			;in this case AX is always equal to itself so it's 0
			;this is done because it takes up less bytes than MOV AX, 0
MOV DS, AX		;load the register DS with the value  0
MOV AH, 0x0e		;call 0EH bios call - load the register AH with a bios call?
MOV SI, string		;move starting address of `string` into SI

loopthatshit:
  LODSB			;load byte at DS into AL, update (increment) SI
  CMP AL, 0		;if result is 0 set a flag for jmp
			;jmp tests the flag and jumps if it's set
  JZ hltthatshit
  INT 0x10		;do the print call
  JMP loopthatshit	;jump back to loop start

hltthatshit:
  JMP 0xf4

string:
  db 'YASSSSSS BITCH',0


TIMES 510-($-$$) db 0
DW 0xAA55
