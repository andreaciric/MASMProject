INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data


     winTitle BYTE "Repeat Pattern Game", 0

     Welcome_message1 BYTE    "Welcome to the Repeat Pattern Game!", 0dh, 0ah,
                              "  ", 0dh, 0ah,
                              "Rules: ", 0dh, 0ah,
                              "1. At the beginning of the game, there are 4 squares in different colors and each color is assigned a random number from 1 to 4", 0dh, 0ah, 0
                       
     Welcome_message2 BYTE    "2. You have to remember which number corresponds to which color.", 0dh, 0ah,
                              "3. Order of colored squares changes in every turn and you have to write the corresponding numbers in the same order as given squares", 0dh, 0ah, 0

     Welcome_message3 BYTE    "4. Array is given in the order: upper left -> upper right -> lower left -> lower right.", 0dh, 0ah,
                              "5. Each time you enter a successful sequence, the squares order is regenerated", 0dh, 0ah,
                              "6. You have 60 seconds to get as many combinations as possible", 0dh, 0ah,
                              "  ", 0dh, 0ah,
                              "Press any key to start the game...", 0dh, 0ah, 0

     Color_message  BYTE      " ", 0dh, 0ah,
                              " ", 0dh, 0ah,
                              "Redosled boja po sekvenci je: PLAVA ZELENA CRVENA ZUTA -> ", 0


.code
;//---------------------------------------------------------------------------------------------------------------------
;//This function sets startup screen
     start_screen PROC
                   
          push edx
          push eax

          INVOKE SetConsoleTitle, ADDR winTitle;// Naslov konzole

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

;//-----------------------------------------------------------------------------
;// 
;//
     example_screen PROC,
                         Arr: PTR BYTE       ;//pointer to given arrayGame
;//-----------------------------------------------------------------------------

               push edx
               push eax
               push ecx
               push ebx

               INVOKE draw_squares, Arr
               
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

               pop ebx
               pop ecx
               pop eax
               pop edx
               ret

     example_screen ENDP
END