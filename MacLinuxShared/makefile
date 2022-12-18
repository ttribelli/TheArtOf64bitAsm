# makefile
#
# make {DEBUG=1} hello-macx64|hello-linx64

ifdef DEBUG
AS_DEBUG    = -g
LD_DEBUG    =
GCC_DEBUG   = -g
CLANG_DEBUG = -g
else
AS_DEBUG    =
LD_DEBUG    =
GCC_DEBUG   =
CLANG_DEBUG =
endif

AS    = as $(AS_DEBUG)
LD    = ld $(LD_DEBUG)
GCC   = g++ $(GCC_DEBUG)
CLANG = clang++ $(CLANG_DEBUG)

#------------------------------------------------------------------------------

all:
	echo make {DEBUG=1} hello-macx64\|hello-linx64

#------------------------------------------------------------------------------

clean:
	rm a.out hello-macx64 hello-linx64 *.o

#------------------------------------------------------------------------------

hello-macx64: hello-macx64.o syscall-macx64.o
	$(LD) -o hello-macx64 -e standalone -static hello-macx64.o syscall-macx64.o

hello-macx64.o: hello-x64.s
	$(AS) -o hello-macx64.o hello-x64.s

syscall-macx64.o: syscall-macx64.s
	$(AS) -o syscall-macx64.o syscall-macx64.s

#------------------------------------------------------------------------------

hello-linx64: hello-linx64.o syscall-linx64.o
	$(LD) -o hello-linx64 -e standalone -static hello-linx64.o syscall-linx64.o

hello-linx64.o: hello-x64.s
	$(AS) -o hello-linx64.o hello-x64.s

syscall-linx64.o: syscall-linx64.s
	$(AS) -o syscall-linx64.o syscall-linx64.s
