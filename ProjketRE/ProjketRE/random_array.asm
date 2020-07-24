INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data

     ; //promenljive za dodelu brojeva bojama
     red_num dword 0
     blue_num dword 0
     green_num dword 0
     yellow_num dword 0

.code

random_array PROC,
                    Arr: PTR BYTE

          push ecx
          push esi
          push edi

     variable_reset : ;//reset igre
          mov red_num, 0
          mov blue_num, 0
          mov green_num, 0
          mov yellow_num, 0

          mov ecx, 4
          mov esi, 0
          mov edi, Arr

     assign:;//generisanje random niza
          mov eax, 4
          call RandomRange
          add eax, 1

          CMP eax, red_num
          JE assign
          CMP eax, blue_num
          JE assign
          CMP eax, green_num
          JE assign
          CMP eax, yellow_num
          JE assign

          CMP esi, 0
          JE assign_first
          CMP esi, 1
          JE assign_second
          CMP esi, 2
          JE assign_third
          CMP esi, 3
          JE assign_fourth
          CMP esi, 4
          JE assign_end


     ;// Dodela vrednosti konstantama

     assign_first:
          mov red_num, eax
          jmp assign_array

     assign_second :
          mov blue_num, eax
          jmp assign_array

     assign_third :
          mov green_num, eax
          jmp assign_array

     assign_fourth :
          mov yellow_num, eax
          jmp assign_array


     assign_end :
          mov ecx, 4
          mov esi, 0

          jmp the_end


     assign_array : ;// Upisivanje vrednosti u niz

          mov BYTE PTR [edi], al
          
          inc esi
          inc edi

          ; //loop assign
          dec ecx
          cmp ecx, 0
          jnz assign


     the_end:
          pop edi
          pop esi
          pop ecx
          ret

random_array ENDP
END