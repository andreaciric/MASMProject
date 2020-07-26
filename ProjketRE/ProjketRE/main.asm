INCLUDE Irvine32.inc
INCLUDE procedure.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.const
     n = 4     ; //broj elemenata niza  

.data

     assign_array_indicator BYTE 0      ;//indikator pocetnog niza
     colors BYTE 0h, 1h, 2h, 4h, 0Eh

.data?

     arrayGame BYTE n dup(?)          ;//niz brojeva dodeljivanih u toku igre za random redosled kvadrata
     arraySetup BYTE n dup(?)          ;//inicijalna dodela brojeva bojama
     xposition BYTE ?
     yposition BYTE ?

     .code
          main PROC
          INVOKE random_array, OFFSET arrayGame, OFFSET arraySetup, assign_array_indicator

               mov edx, 0
          draw:
               mov ebx, OFFSET arrayGame
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

          first_square:
               mov xposition, 15
               mov yposition, 1
               mov edx, 1
               JMP variables_set

          second_square :
               mov xposition, 35
               mov yposition, 1
               mov edx, 2
               JMP variables_set

          third_square :
               mov xposition, 15
               mov yposition, 10
               mov edx, 3
               JMP variables_set

          fourth_square :
               mov xposition, 35
               mov yposition, 10
               mov edx, 4
                     
          variables_set:
               INVOKE draw_square, xposition, yposition, eax
               inc ebx
               CMP edx, 4
               JNE draw
               
               
               INVOKE ExitProcess, 0

     main ENDP
END main