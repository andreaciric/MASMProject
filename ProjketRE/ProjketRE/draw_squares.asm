INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data
     colors BYTE 0h, 1h, 2h, 4h, 0Eh

.data?
     xposition BYTE ?
     yposition BYTE ?

.code

     draw_square PROC,
                         xpos: BYTE,
                         ypos: BYTE,
                         color: PTR BYTE

          
          push edx
          push eax
          push ebx
          push edi
          push esi
          
          mov esi, 16
          mov edi, 8
          mov dh, xpos
          mov dl, ypos
          mov ebx, color
          mov ecx, [ebx]
          movzx eax, cl
          call SetTextColor
          mov al, 0DBh

          .WHILE (esi > 0)
               .WHILE (edi > 0)
                    call gotoxy
                    call WriteChar
                    dec edi
                    inc dh
               .ENDW
               mov dh, xpos
               mov edi, 8
               dec esi
               inc dl
          .ENDW
         
          pop esi
          pop edi
          pop ebx
          pop eax
          pop edx
          ret
     draw_square ENDP

     draw_squares PROC,
                         Arr: PTR BYTE

               pushad

               mov edx, 0
               mov ebx, Arr

          draw :
               mov ecx, [ebx]
               movzx eax, cl
               mov ecx, eax
               mov eax, OFFSET colors
               mov esi, 0h

               .while (esi != ecx)
                    inc esi
                    inc eax
               .endw

               CMP edx, 0
               JE first_square
               CMP edx, 1
               JE second_square
               CMP edx, 2
               JE third_square
               CMP edx, 3
               JE fourth_square

          first_square :
               mov xposition, 1
               mov yposition, 1
               mov edx, 1
               JMP variables_set

          second_square :
               mov xposition, 1
               mov yposition, 19
               mov edx, 2
               JMP variables_set

          third_square :
               mov xposition, 10
               mov yposition, 1
               mov edx, 3
               JMP variables_set

          fourth_square :
               mov xposition, 10
               mov yposition, 19
               mov edx, 4

          variables_set :
               INVOKE draw_square, xposition, yposition, eax
               inc ebx
               CMP edx, 4
               JNE draw

               popad
          ret
     draw_squares ENDP
     
END