INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data
colors BYTE 0h, 1h, 2h, 4h, 0Eh
p dword 0

.data?
     xposition BYTE ?
     yposition BYTE ?

.code
;//---------------------------------------------------------------------------
;// This procedure draws a square in given colour at given starting position
     draw_square PROC,
                         xpos: BYTE,         
                         ypos: BYTE,
                         color: PTR BYTE,
                         k:  PTR DWORD

;//---------------------------------------------------------------------------
          push edx
          push eax
          push ebx
          push edi
          push esi

          ;//dimensions of a square (how many 0DBh objects in a row and column)
               mov esi, 16
               mov edi, 8

          ;//setting parameters for drawing functions
               mov dh, xpos
               mov dl, ypos
               mov ebx, color
               mov ecx, [ebx]
               movzx eax, cl
               mov ecx, k
               mov [ecx], eax
               call SetTextColor
               mov al, 0DBh

          ;//drawing 0DBh objects 
          .WHILE(esi > 0)
               .WHILE(edi > 0)
                    call Gotoxy
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

;//----------------------------------------------------------------------------------------------------------
;//This procedure sets parameters for all four squares  and calls draw_square procedure for each square
  
     draw_squares PROC,
                         Arr: PTR BYTE,
                         OutArrColors: PTR BYTE
;//----------------------------------------------------------------------------------------------------------
               pushad

               mov edi, 0
               mov ebx, Arr
               mov edx, OutArrColors

          draw :
               mov ecx, [ebx]
               movzx eax, cl
               mov ecx, eax
               mov eax, OFFSET colors
               mov esi, 0h

               ;//sets a color for each square
               .while (esi != ecx)
                    inc esi
                    inc eax
               .endw

               CMP edi, 0
               JE first_square
               CMP edi, 1
               JE second_square
               CMP edi, 2
               JE third_square
               CMP edi, 3
               JE fourth_square

          ;//setting position of squares
          first_square :
               mov xposition, 1
               mov yposition, 1
               mov edi, 1
               JMP variables_set

          second_square :
               mov xposition, 1
               mov yposition, 19
               mov edi, 2
               JMP variables_set

          third_square :
               mov xposition, 10
               mov yposition, 1
               mov edi, 3
               JMP variables_set

          fourth_square :
               mov xposition, 10
               mov yposition, 19
               mov edi, 4

          variables_set :
               INVOKE draw_square, xposition, yposition, eax, OFFSET p
               mov eax, [p]                  ;// saves the order of colors on the screen
               mov [edx], eax
               inc edx
               inc ebx
               cmp edi, 4
               jne draw

               popad
          ret
     draw_squares ENDP
     
END