;%include 'io.inc'
extern free
extern malloc

section .data
struc arbol
    izq resd 1
    der resd 1
    valor resd 1
endstruc

SizeofNodo equ 12    

section .text
global CMAIN
    
CMAIN:
    mov ebp, esp; for correct debugging
   
    ;Reservar memoria para la estuctura de arbol
    push ebp
    mov ebp, esp
    push SizeofNodo
    call malloc
    sub esp, 12                   ;Reservar espacio para tres punteros
    
    mov ebx, [ebp + 8]            ;Obtener el puntero al nodo izquierdo
    mov ecx, [ebp + 12]           ;Obtener el puntero al nodo derecho
    mov edx, [ebp + 16]           ;Obtener el valor del nodo
    
    mov [eax], ebx                ;Asignar el puntero al nodo izquierdo
    mov [eax + 4], ecx            ;Asignar el puntero al nodo derecho
    mov [eax + 8], edx            ;Asignar el valor al nodo
    
    mov esp, ebp                  ;Retornar el puntero al arbol
    pop ebp
    
    xor eax, eax
    call free

    ret