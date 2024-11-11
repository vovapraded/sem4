cmake_minimum_required(VERSION 3.29)
project(sem4 C)

set(CMAKE_C_STANDARD 17)

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)

#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIE")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIE")
#set(CMAKE_ASM_NASM_FLAGS "${CMAKE_C_FLAGS} -PIE")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pie")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -no-pie")
# Компилируем ассемблерный файл в объектный.
set(SOURCES
        main.c
        lib.asm
)

add_executable(my_app ${SOURCES})

# Если у вас есть статическая библиотека, создаем её.
# Если её нет, удалите следующий блок.
add_library(lib STATIC lib.asm)

# Линкуем исполняемый файл с библиотеками (если нужно).
target_link_libraries(my_app PRIVATE lib)