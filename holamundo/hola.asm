%include 'io.inc'

SYS_SALIDA equ 1

section .data
     msg db "Hola, Mundo!!!",0x0a
     len equ $ - msg ;longitud de msg
     
section .text

global CMAIN ;para el linker

CMAIN:
    mov rbp, rsp; for correct debugging
    mov ebp, esp; for correct debugging ;marca la entrada
     mov eax, 4 ;llamada al sistema (sys_write)
     mov ebx, 1 ;descripción de archivo (stdout)
     mov ecx, msg ;msg a escribir
     mov edx, len ;longitud del mensaje
     int 0x80 ;llama al sistema de interrupciones
fin: mov eax, SYS_SALIDA ;llamada al sistema (sys_exit)
     int 0x80