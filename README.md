# F256jr-cc65-lib
Unofficial cc65 platform library for the Foenix Retro Systems F256jr. In conjunction with the cc65 8-bit compiler, you can use this to cross-compile C programs for the F256jr.
This should not be interpreted to be complete or fully functional! Use at your own risk. 
However, it does let you compile and build apps for the F256jr. I will try to build out support for read/write/etc, as those things become available on the platform. 

## What's an F256jr?
The [F256jr](https://c256foenix.com/?v=7516fd43adaa) and F256K are newly-created retro computers based around a WDC 65C02 running at about 6 MHz. It is not a new Commodore, Atari, or Apple ][: it is a new thing, designed for hobbyist users who want to experience coding and using the "simpler" computers of the early-mid 1980s. It is part of a family of computers that share much of the same architecture. Other family members include the C256 Foenix, running a 65816 (fast) 8-bit processor, the A2560K/U which sport Motorolla 680x0 processors.

## How to use it

1. Get cc65
1. Build cc65
1. Copy the "f256jr.cfg" and "f256jr_overlay.cfg" files into the "cfg" folder of cc65
1. Copy the "f256jr.lib" into the "lib" folder of cc65
1. Copy the "f256jr.h" header into the "include" folder of cc65
1. Build stuff
1. Cross-load onto the JR using FoenixMgr
1. Execute with DOS command "exec $400" (or other address if you changed the cfg file).

### Documentation
See f256jr.html in the documentation folder for cc65-style notes.

## Status
Very incomplete

### Completed
 * 

### ToDo
 * 
