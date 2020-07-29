INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data

     
     indicator      BYTE 0
     arr_indicator  BYTE 0

     winTitle            BYTE      "Repeat Pattern Game", 0

     Welcome_message1    BYTE      "Welcome to the Repeat Pattern Game!", 0dh, 0ah,
                                   "  ", 0dh, 0ah,
                                   "Rules: ", 0dh, 0ah,
                                   "1. At the beginning of the game, there are 4 squares in different colors and each color is assigned a random number from 1 to 4", 0dh, 0ah, 0
                       
     Welcome_message2    BYTE      "2. You have to remember which number corresponds to which color.", 0dh, 0ah,
                                   "3. Order of colored squares changes in every turn and you have to write the corresponding numbers in the same order as given squares", 0dh, 0ah, 
                                   "4. Array is given in the order: upper left -> upper right -> lower left -> lower right.", 0dh, 0ah, 0

     Welcome_message3    BYTE      "5. Each time you enter a successful sequence, the squares order is regenerated", 0dh, 0ah,
                                   "6. You have 60 seconds to get as many combinations as possible", 0dh, 0ah,
                                   "  ", 0dh, 0ah,
                                   "Press any key to start the game...", 0dh, 0ah, 0

     Color_message       BYTE      " ", 0dh, 0ah,
                                   " ", 0dh, 0ah,
                                   "The order of colors in sequence is: BLUE GREEN RED YELLOW -> ", 0

     Blank_message       BYTE      " ", 0dh, 0ah,
                                   " ", 0dh, 0ah,0

     Test_message        BYTE      "THIS IS THE TEST ROUND!", 0dh, 0ah,
                                   " ", 0dh, 0ah, 0

     Answer_message      BYTE      "Write your answer: ", 0dh, 0ah, 0

     TryAgain_message    BYTE      "Try again!", 0dh, 0ah, 0

     Start_message       BYTE      " ", 0dh, 0ah,
                                   "WELL DONE!", 0dh, 0ah,
                                   "Press any key to start the game...", 0dh, 0ah, 0
     
     EndGame_message     BYTE      " ", 0dh, 0ah,
                                   "Wrong Answer!", 0dh, 0ah, 0

     TimeOut_message     BYTE      " ", 0dh, 0ah,
                                   "Time's up! ", 0dh, 0ah,
                                   "Your score is: ", 0dh, 0ah, 0   

.data?
     arrayOut       BYTE      4    dup (?)
     time           DWORD     ?
     arraySetup     BYTE      4    dup (?)  
     
.code
;//---------------------------------------------------------------------------------------------------------------------
;//This function sets startup screen with game instructions

     start_screen PROC
                   
          push edx
          push eax

          INVOKE SetConsoleTitle, ADDR WinTitle

          call clrscr
          mov eax, 15
          call SetTextColor
          mov edx, OFFSET Welcome_message1
          call WriteString
          mov edx, OFFSET Welcome_message2
          call WriteString
          mov edx, OFFSET Welcome_message3
          call WriteString
          call readchar
          call clrscr

          pop eax
          pop edx
          ret

     start_screen ENDP

;//---------------------------------------------------------------------------------------------------------------------
;//This function sets example screen

     example_screen PROC,
                         Arr: PTR BYTE, 
                         OutArrColors: PTR BYTE,
                         ArrSetup : PTR BYTE,
                         assign_array_indicator: BYTE
;//---------------------------------------------------------------------------------------------------------------------

               push edx
               push eax
               push ecx
               push ebx

               call clrscr
               
               INVOKE random_array, Arr, ArrSetup, assign_array_indicator
               mov assign_array_indicator, 1
               INVOKE draw_squares, Arr, OutArrColors
               
               mov eax, 15
               call SetTextColor

               mov edx, OFFSET Color_message
               call WriteString

               mov ecx, 4
               mov edx, Arr
            L:
               mov ebx, [edx]
               movzx eax, bl
               call WriteDec
               mov al, 20h
               call WriteChar
               inc edx
               loop L

               mov edx, OFFSET Blank_message
               call WriteString

               mov edx, OFFSET Test_message
               call WriteString

               mov edx, OFFSET Answer_message
               call WriteString

               INVOKE true_answer, ArrSetup, OutArrColors, OFFSET arrayOut

          again:          
               INVOKE get_answer, OFFSET arrayOut, OFFSET indicator
               movzx edi, indicator
               .if ( edi == 0)
                    mov edx, OFFSET TryAgain_message
                    call WriteString
                    mov edx, OFFSET Answer_message
                    call WriteString
                    jmp again
               .endif

               mov edx, OFFSET Start_message
               call WriteString
               call ReadChar
               call clrscr

               pop ebx
               pop ecx
               pop eax
               pop edx
               ret

     example_screen ENDP

;//---------------------------------------------------------------------------------------------------------------------
;//This function sets game screen

     game_screen PROC,
                         Arr: PTR BYTE, 
                         OutArrColors: PTR BYTE,
                         ArrSetup : PTR BYTE,
                         score: DWORD
;//---------------------------------------------------------------------------------------------------------------------

          push edx
          push eax
          push ebx

          call GetMseconds
          mov time, eax

 again:
          call clrscr
          INVOKE random_array, Arr, ArrSetup, 1
          INVOKE draw_squares, Arr, OutArrColors

          mov eax, 15
          call SetTextColor

          mov edx, OFFSET Blank_message
          call WriteString

          mov edx, OFFSET Answer_message
          call WriteString

          INVOKE true_answer, ArrSetup, OutArrColors, OFFSET arrayOut

          INVOKE get_answer, OFFSET arrayOut, OFFSET indicator
          movzx edi, indicator
          .if (edi == 0)
               mov edx, OFFSET EndGame_message
               call WriteString
               jmp the_end
          .endif
          
          call GetMseconds
          sub eax, time
          .if (eax < 60000)
               inc score
               call clrscr
               jmp again
          .else
               call clrscr
               mov edx, OFFSET TimeOut_message
               call WriteString
               mov eax, score
               call WriteDec

          .endif

         
     the_end:
          pop ebx
          pop eax
          pop edx
          ret

      game_screen ENDP

END