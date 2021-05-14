section .data

; dd - define double word - 4bytes
; db - define byte - 1byte
; dw - define word - 2bytes
; dq - define quad word - 4bytes
; dt - define ten word - 10bytes
   num1 dd 50
   num2 dd 10
   msg1 db 'num1 maior que num2', 0xa
   len1 equ $ - msg1
   msg2 db 'num2 maior que num1', 0xa
   len2 equ $ - msg2

section .text
   global _start
   _start:
      mov eax, DWORD [num1]
      mov ebx, DWORD [num2]
      cmp eax, ebx
      ; je = jg > jge >= jl < jle <= jne !=
      jge maior
      mov edx, len2
      mov ecx, msg2
      jmp final
   maior:
      mov edx, len1
      mov ecx, msg1
   final:
      mov ebx, 1
      mov eax, 4
      int 0x80
      mov eax, 1
      int 0x80