# TheArtOf64bitAsm

This repository contains online material for the book  

The Art of 64-Bit Assembly, Volume 1  
x86-64 Machine Organization and Programming  
by Randall Hyde  
2021  
ISBN-13: 9781718501089  

https://nostarch.com/art-64-bit-assembly-volume-1  
https://www.amazon.com/Art-64-Bit-Assembly-Language/dp/1718501080  

# MacLinuxShared

Contains sample code for sharing x86-64 source code between macOS and Linux.

Use "make hello-macx64" or "make hello-linx64" to create the appropriate executable.

The shared source code is in hello-x64.s. The platform specific code is in syscall-macx64.s and syscall-linx64.s.

The code uses "intel syntax mode" to maintain compatibility with Intel and AMD documentation. This also avoids some bugs in the gnu assembler, gas. For example, fsub having operands reversed.