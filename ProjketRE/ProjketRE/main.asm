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
     score DWORD 0

     PlayAgain_message BYTE   "Do you want to play again?", 0


.data?

     arrayGame BYTE n dup(?)          ;//niz brojeva dodeljivanih u toku igre za random redosled kvadrata
     arraySetup BYTE n dup(? );//inicijalna dodela brojeva bojama
     arrayOutColors BYTE n dup(?)
     arrayOut BYTE n dup(? )

     .code
          main PROC

               INVOKE start_screen
          again:
               INVOKE example_screen, OFFSET arrayGame, OFFSET arrayOutColors, OFFSET arraySetup, assign_array_indicator
               INVOKE game_screen, OFFSET arrayGame, OFFSET arrayOutColors, OFFSET arraySetup, score
               
               mov ebx, 0
               mov edx, OFFSET PlayAgain_message
               mov assign_array_indicator, 0
               mov score, 0
               call MsgBoxAsk
               cmp eax, IDNO
               jne again

               INVOKE ExitProcess, 0

     main ENDP
END main