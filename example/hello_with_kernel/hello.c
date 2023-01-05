// test file for compiling for f256jr - using kernel
// NOTE: will not work without f256jr_with_kernel.lib, see gadget's project

// compile example:

//cc65 -g --cpu 65C02 -t none -Os -D_F256JR_ -T hello.c -o hello.s
//ca65 -t none hello.s
//ld65 -C f256jr.cfg -o hello.rom hello.o f256jr_with_kernel.lib -m hello.map -Ln labels.lbl

// C includes
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// f256 includes
#include <f256jr.h>
#include <kernel.h>


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


#include "kernel.h"

void
cls()
{
    uint8_t * const vram = (uint8_t*)0xc000;
    
    uint16_t i;
    
    asm("lda #$02");
    asm("sta $01");  
    for (i = 0; i < 80*60; i++) {
        vram[i] = 32;
   }
}

void
putc(char c)
{
    static char *vram = (char*)0xc000;
    *vram++ = c;
}

static char buf[10];

int 
main(int argc, const char *argv[])
{
    char c = 0;
    uint8_t fd;
    
    kernel_init();
    cls();
    
    fd = open("test.txt", O_WRONLY);
    if (fd != 0) {
        write(fd, "test!", 5);
        close(fd);
    }
    
    fd = open("test.txt", O_RDONLY);
    if (fd != 0) {
        int i, bytes;
        for(;;) {
            bytes = read(fd, &buf, sizeof(buf));
            if (bytes <= 0) {
                break;
            }
            for (i = 0; i < bytes; i++) {
                putc(buf[i]);
            }
        }
        close(fd);
    }
    
    for (; c!=3 ;) {
        c = GETIN();
        if (!c) {
            YIELD();  // Be polite.
            continue;
        }
        putc(c);
    }
    
    return 0;
}
