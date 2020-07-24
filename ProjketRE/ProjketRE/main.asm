INCLUDE Irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.const
     n = 4     ; //broj elemenata niza  

.data

     ;// konstante za proveru unosa 
     red_num dword 0
     blue_num dword 0
     green_num dword 0
     yellow_num dword 0

     assign_array_indicator BYTE 0      ;//indikatored pocetnog niza

.data?

     arrayGame dword n dup(?)
     arraySetup dword n dup(?)

.code
     main PROC


     variable_reset:     ;//reset igre 
          mov red_num, 0
          mov blue_num, 0
          mov green_num, 0
          mov yellow_num, 0

          mov ecx, n
          mov esi, 0

     assign:;// Generisanje random niza
          mov eax, n
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
          mov ecx, n
          mov esi, 0

          jmp create_box1


     assign_array : ;// Upisivanje vrednosti u niz

          mov arrayGame[esi * 4], eax
          .if assign_array_indicator == 0;// Proverava da li je u pitanju test primer
          mov arraySetup[esi * 4], eax
          .endif
          inc esi

          ; //loop assign
          dec ecx
          cmp ecx, 0
          jnz assign


     create_box1:

     main ENDP
END main