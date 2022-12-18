# syscall-linx64.s
#
# System calls are platform specific, these are for Linux

                .intel_syntax noprefix

                .global     syscall_write, syscall_exit

stdout          =           1
stderr          =           2

syscall_write:  push        rcx
                push        rdi
                push        r11

                mov         rdi,        stderr
                mov         rax,        1           # write
                syscall

                pop         r11
                pop         rdi
                pop         rcx
                ret

syscall_exit:   mov         rdi,        rax         # Exit code
                mov         rax,        60          # exit
                syscall
