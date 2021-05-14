section .data:
   msg db "Hello world!", 0xa
   len equ $ - msg

section .text:
   global _start

   _start:
      mov edx, len
      mov ecx, msg
      mov ebx, 1 ;arquivo de saida, mostra na tela a msg
      mov eax, 4 ;manda informacao p sistema
      int 0x80 ;endereco do kernel, sempre q enviar algo p so, tem q usar isso
      mov eax, 1
      mov ebx, 0
      int 0x80