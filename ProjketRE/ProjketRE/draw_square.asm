INCLUDE Irvine32.inc
INCLUDE procedure.inc


.code

     draw_square PROC,
                         xposition: BYTE,
                         yposition: BYTE,
                         color: PTR BYTE

          
          push edx
          push eax
          push ebx
          push edi
          push esi
          
          mov esi, 16
          mov edi, 8
          mov dh, xposition
          mov dl, yposition
          mov ebx, [color]
          movzx eax, bl
          call SetTextColor
          mov al, 0DBh

          .WHILE (esi > 0)
               .WHILE (edi > 0)
                    call gotoxy
                    call WriteChar
                    dec edi
                    inc dh
               .ENDW
               mov dh, xposition
               mov edi, 8
               dec esi
               inc dl
          .ENDW
         
          pop esi
          pop edi
          pop ebx
          pop eax
          pop edx

     draw_square ENDP
END