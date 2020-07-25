INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data

     ; //promenljive za dodelu brojeva bojama
     red_num byte 0
     blue_num byte 0
     green_num byte 0
     yellow_num byte 0

.code

random_array PROC,
                    Arr: PTR BYTE,
                    ArrSetup: PTR BYTE,
                    indicator: BYTE

          push ecx
          push esi
          push edi
          push eax
          push ebx

     variable_reset : ;//reset igre
          mov red_num, 0
          mov blue_num, 0
          mov green_num, 0
          mov yellow_num, 0

          mov ecx, 4
          mov esi, 0
          mov edi, Arr
          mov ebx, ArrSetup

     assign:;//generisanje random niza
          mov eax, 4
          call RandomRange
          add eax, 1

          CMP al, red_num
          JE assign
          CMP al, blue_num
          JE assign
          CMP al, green_num
          JE assign
          CMP al, yellow_num
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
          mov red_num, al
          jmp assign_array

     assign_second :
          mov blue_num, al
          jmp assign_array

     assign_third :
          mov green_num, al
          jmp assign_array

     assign_fourth :
          mov yellow_num, al
          jmp assign_array


     assign_end :
          mov ecx, 4
          mov esi, 0

          jmp the_end


     assign_array : ;// Upisivanje vrednosti u niz

          mov [edi], al

          .if indicator == 0    ;// Proverava da li je u pitanju pocetna dodela vrednosti
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