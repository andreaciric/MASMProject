INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data

     uno byte 0
     due byte 0
     tre byte 0
     quattro byte 0

.code

;//-----------------------------------------------------------------------------------------------------------------
;// This procedure generates a random four element array with different values [1,4]
random_array PROC,
                    Arr: PTR BYTE,
                    ArrSetup : PTR BYTE,
                    indicator : BYTE
;//-----------------------------------------------------------------------------------------------------------------
          push ecx
          push esi
          push edi
          push eax
          push ebx

          call Randomize

     variable_reset : 
          mov uno, 0
          mov due, 0
          mov tre, 0
          mov quattro, 0

          mov ecx, 4
          mov esi, 0
          mov edi, Arr
          mov ebx, ArrSetup

     assign:                       ;//generating random value
          mov eax, 4
          call RandomRange
          add eax, 1

          cmp al, uno
          je assign
          cmp al, due
          je assign
          cmp al, tre
          je assign
          cmp al, quattro
          je assign

          cmp esi, 0
          je assign_first
          cmp esi, 1
          je assign_second
          cmp esi, 2
          je assign_third
          cmp esi, 3
          je assign_fourth
          cmp esi, 4
          je assign_end


     ;// assign values to constants

     assign_first:
          mov uno, al
          jmp assign_array

     assign_second :
          mov due, al
          jmp assign_array

     assign_third :
          mov tre, al
          jmp assign_array

     assign_fourth :
          mov quattro, al
          jmp assign_array


     assign_end :
          mov ecx, 4
          mov esi, 0

          jmp the_end


     assign_array :                ;// writing elements into array

          mov [edi], al

          .if indicator == 0    ;// Generates arraySetup at the begining of the game
               mov[ebx], al
               inc ebx
          .endif

          inc esi
          inc edi

          ; //loop assign
          dec ecx
          cmp ecx, 0
          jnz assign

     the_end:

          pop ebx
          pop eax
          pop edi
          pop esi
          pop ecx
          ret

random_array ENDP

END