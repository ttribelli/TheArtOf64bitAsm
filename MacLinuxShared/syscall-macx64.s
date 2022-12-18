# syscall-macx64.s
#
# System calls are platform specific, these are for macOS

                .intel_syntax noprefix

                .global     syscall_write, syscall_exit

stdout          =           1
stderr          =           2

syscall_write:  push        rdi

                mov         rdi,        stderr
                mov         rax,        0x2000004   # write
                syscall

                pop         rdi
                ret

syscall_exit:   mov         rdi,        rax         # Exit code
                mov         rax,        0x2000001   # exit
                syscall
