SYS_EXIT  equ 1
RET_EXIT  equ 5
SYS_READ  equ 3
SYS_WRITE equ 4
STD_IN    equ 0
STD_OUT   equ 1
MAX_IN    equ 10

segment .data
   msg db "Entre com seu nome: ", 0xA, 0xD
   len equ $ - msg

segment .bss
   nome resb 2

segment .text
   global _start

   _start:
      ; ax acumulador de operacoes numericas
      ; bx acumulador de registro base
      ; cx registro de conta, realizadas com operacao string
      ; dx registro de dados
      ; normalmente se usa 'e' antes, mas em arquitetura 64bits podese usar 'r' tambem, como rax, rbx e etc
      mov eax, SYS_WRITE
      mov ebx, STD_OUT
      mov ecx, msg
      mov edx, len
      int 0x80

      mov eax, SYS_READ
      mov ebx, STD_IN
      mov ecx, nome
      mov edx, MAX_IN
      int 0x80

   exit:
      mov eax, SYS_EXIT
      mov ebx, RET_EXIT ; msm coisa q fzr 'xor ebx, ebx'
      int 0x80

; 64bits
;    nasm -f elf64 teste.nasm
;    ld -s -o teste teste.o
; 32bits
;    nasm -f elf32 teste.nasm
;    ld -m elf_i386 -o teste teste.o

; comandos linux
; file teste ; analisa oq é cada arquivo
; ldd teste ; dependencias do objeto compatilhado
; objdump -dM intel teste ; codigo .asm do executavel ou objeto compartilhado