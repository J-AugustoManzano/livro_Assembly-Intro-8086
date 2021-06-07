; multi-segment executable file template.

data segment
    ; add your data here!
    mensagem db "Ola, Mundo$" 
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    MOV     DX, OFFSET mensagem

    MOV     AH, 09h
    INT     21h

    MOV     AH, 4Ch
    INT     21h
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
