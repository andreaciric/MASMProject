INCLUDE Irvine32.inc
INCLUDE procedure.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.const
     n = 4     ; //number of elements in array  

.data

     assign_array_indicator   BYTE      0      
     score                    DWORD     0
     PlayAgain_message        BYTE      "Do you want to play again?", 0


.data?

     arrayGame      BYTE n dup(?)       ;//array of numbers generated during the game
     arraySetup     BYTE n dup(?)       ;//numbers assigned to colors
     arrayOutColors BYTE n dup(?)       ;//order of colors on screen
     arrayOut       BYTE n dup(?)       ;//true answer array

.code
    main PROC

          INVOKE start_screen
     again:
          INVOKE example_screen, OFFSET arrayGame, OFFSET arrayOutColors, OFFSET arraySetup, assign_array_indicator
          INVOKE game_screen, OFFSET arrayGame, OFFSET arrayOutColors, OFFSET arraySetup, score

          ;// play again?
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