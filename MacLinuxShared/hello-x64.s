# hello-x64.s
#
# Shared source code for Mac and Linux, accomodations made:
#   Always specify RIP.
#   Platform specfic code in separate platform specific files. Ex:
#       syscall-macx64.s
#       syscall-linx64.s
#
# macOS:
#   make hello-macx64
# Linux:
#   make hello-linx64

                .intel_syntax noprefix

                .global     standalone
                .global     print_string

                .data

# clang bug in assembly language using:
#   .intel_syntax noprefix
# If you define a constant:
#   some_string:    .ascii "Some asm string"
#   some_string_len =      . - some_string
#   mov rsi, some_string_len
# clang will erroneously treat this as a read from memory.
# gcc will correctly treat this as loading a constant.
# In intel syntax mode the $ prefix is no longer necessary
# but in this case clang is not acting so.
# Workaround, turn the constant into an initialized variable:
#   some_string_len: .quad . - some_string
#   mov rsi, some_string_len[rip]
some_string:    .ascii      "Hello World!\n"
some_string_len: .quad      . - some_string

                .text

#------------------------------------------------------------------------------
# print_string - Print a string to a standard stream
# Parameters    RDI         String address
#               RSI         String length
# Return        RAX >= 0    Bytes written
#               RAX <  0    Error
# Volatile      None
print_string:   push        rdx
                push        rsi

                mov         rdx, rsi                # Length
                mov         rsi, rdi                # String
                call        syscall_write

                pop         rsi
                pop         rdx
                ret

#------------------------------------------------------------------------------
standalone:     lea         rdi,    some_string[rip]
                mov         rsi,    some_string_len[rip]
                call        print_string
                call        syscall_exit
