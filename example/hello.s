;
; File generated by cc65 v 2.18 - N/A
;
	.fopt		compiler,"cc65 v 2.18 - N/A"
	.setcpu		"65C02"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	on
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.dbg		file, "hello.c", 2098, 1672266033
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stdbool.h", 2506, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stdio.h", 6189, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stddef.h", 3057, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stdarg.h", 2913, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stdlib.h", 5999, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/string.h", 5104, 1590865395
	.dbg		file, "/opt/homebrew/Cellar/cc65/2.19/share/cc65/include/stdint.h", 6196, 1590865395
	.dbg		file, "../include/f256jr.h", 8689, 1672257994
	.forceimport	__STARTUP__
	.forceimport	initmainargs
	.export		_main

; ---------------------------------------------------------------
; int __near__ __cdecl__ main (int, __near__ unsigned char * *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

	.dbg	func, "main", "00", extern, "_main"
	.dbg	sym, "argc", "00", auto, 2
	.dbg	sym, "argv", "00", auto, 0
	.dbg	sym, "vram_loc", "00", auto, -2

.segment	"CODE"

;
; uint8_t* vram_loc = (uint8_t*)0xc000;
;
	.dbg	line, "hello.c", 47
	ldx     #$C0
	lda     #$00
	jsr     pushax
;
; asm("lda #$02");
;
	.dbg	line, "hello.c", 51
	lda     #$02
;
; asm("sta $0001");
;
	.dbg	line, "hello.c", 52
	sta     $0001
;
; asm("lda #66");
;
	.dbg	line, "hello.c", 61
	lda     #66
;
; asm("sta $c050");
;
	.dbg	line, "hello.c", 62
	sta     $c050
;
; asm("lda #$00");
;
	.dbg	line, "hello.c", 65
	lda     #$00
;
; asm("sta $0001");
;
	.dbg	line, "hello.c", 66
	stz     $0001
;
; return 0;
;
	.dbg	line, "hello.c", 68
	tax
;
; }
;
	.dbg	line, "hello.c", 69
	jmp     incsp6
	.dbg	line

.endproc

