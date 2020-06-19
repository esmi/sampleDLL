#/bin/bash
DIR=/usr/bin
CROSS=i686-w64-mingw32
CPP=$DIR/$CROSS-g++
#example_dll.dll
$CPP -c -DBUILDING_EXAMPLE_DLL example_dll.cpp
$CPP -shared -o example_dll.dll example_dll.o -Wl,--out-implib,libexample_dll.a

#example_exe.exe
$CPP -c example_exe.cpp
$CPP -o example_exe.exe example_exe.o -L. -l./example_dll

#example_exe2
#$CPP -static -Wl,-Bstatic -lz -lfoo -Wl,-Bdynamic example_dll -Wl,--as-needed -Wl,-Bstatic-libgcc -static-libstdc++ -o example_exe2.exe example_exe.o example_dll.dll
$CPP -static-libgcc  -o example_exe2.exe example_exe.o example_dll.dll
#
# /usr/bin/i686-w64-mingw32-g++ \
#    -o example_exe3.exe example_exe.o \
#    -Wl,  --enable-runtime-pseudo-reloc \
#    -L. -l./example_dll
#  -Wl,  --enable-runtime-pseudo-reloc \
