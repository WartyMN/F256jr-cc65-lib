;
; Start-up code for cc65 (Foenix F256 Jr)
;

        .export         _exit
        .export         __STARTUP__ : absolute = 1      ; Mark as start-up

        .import         initlib, donelib
        .import         zerobss
		.import   		_main
		.import         __MAIN_START__, __MAIN_SIZE__, __STACKSIZE__   ; Linker-generated

        .include        "zeropage.inc"


; ------------------------------------------------------------------------
; Start-up code

.segment        "STARTUP"

Start:  tsx
        stx     spsave          ; Save the system stack ptr.

; Save space by putting some of the start-up code in the ONCE segment
; which will be re-used by the BSS segment, the heap, and the C stack.

        jsr     init

; Clear the BSS data.

        jsr     zerobss

; Push the command-line arguments, and call main().

        jsr     _main

; Back from main() [this is also the exit() entry].

; ---------------------------------------------------------------------------
; Back from main (this is also the _exit entry):  return to BASIC (or whatever)

_exit:    

; Restore the system stuff.

        ldx     spsave
        txs                     ; Restore stack pointer

; TODO? Restore MMU config and get BASIC back?

		JSR     donelib         ; Run destructors
        RTS


; ------------------------------------------------------------------------

.segment        "ONCE"

init:
; Set up the stack.

        lda     #<(__MAIN_START__ + __MAIN_SIZE__ + __STACKSIZE__)
        ldx     #>(__MAIN_START__ + __MAIN_SIZE__ + __STACKSIZE__)
        sta     sp
        stx     sp+1            ; Set argument stack ptr

; Call the module constructors.

        jmp     initlib


; ------------------------------------------------------------------------
; Data

.segment        "INIT"

ramsave:
        .res    1
spsave: .res    1
