// test file for compiling for f256jr - no use of kernel

// compile example:

//cc65 -g --cpu 65C02 -t none -Os -D_F256JR_ -T hello.c -o hello.s
//ca65 -t none hello.s
//ld65 -C f256jr.cfg -o hello.rom hello.o f256jr.lib -m hello.map -Ln labels.lbl

/*****************************************************************************/
/*                                Includes                                   */
/*****************************************************************************/

// project includes

// C includes
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// cc65 includes
#include <f256jr.h>


/*****************************************************************************/
/*                             Global Variables                              */
/*****************************************************************************/


/*****************************************************************************/
/*                       Private Function Prototypes                         */
/*****************************************************************************/


/*****************************************************************************/
/*                       Private Function Definitions                        */
/*****************************************************************************/


/*****************************************************************************/
/*                        Public Function Definitions                        */
/*****************************************************************************/


int main(int argc, char* argv[])
{
	uint8_t*	vram_loc = (uint8_t*)0xc000;
// 	uint8_t		i;

	// Swap I/O Page 2 into bank 6	
	asm("lda #$02");
	asm("sta $0001");

	// put some junk on the screen
// 	*vram_loc++ = 33;
// 	*vram_loc++ = 34;
// 	*vram_loc++ = 65;
// 	*vram_loc++ = 66;
// 	*vram_loc++ = 67;
// 	*vram_loc++ = 68;
	asm("lda #66");
	asm("sta $c050");

	// Swap I/O Page 2 back out in bank 6	
	asm("lda #$00");
	asm("sta $0001");

	return 0;
}

