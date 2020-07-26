INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data

Welcome_message1 BYTE    "Dobrodosli u Repeat the Pattern Igricu!", 0dh, 0ah,
                         "  ", 0dh, 0ah,
                         "Pravila su jednostavna: ", 0dh, 0ah,
                         "1. Na pocetku igrice svakoj boji dodjeljen je odgovarajuci broj.", 0dh, 0ah, 0

Welcome_message2 BYTE    "2. Igrica se igra pritiskom odgovarajuceg broja za boju kvadrata.", 0dh, 0ah,
                         "3. Pritiskom na enter potvrdjuje se vas unos broja za taj kvadrat.", 0dh, 0ah, 0

Welcome_message3 BYTE    "4. Red kvadrata pocinje u gornjem lijevom uglu i prati oblik slova Z.", 0dh, 0ah,
                         "5. Nakon uspjesne sekvence kvadrati se regenerisu po slucajnim bojama.", 0dh, 0ah,
                         "6. Imate 60 sekundi da pogodite sto vise kombinacija.", 0dh, 0ah,
                         "  ", 0dh, 0ah,
                         "Pritisnite bilo koji taster za pocetak igrice...", 0dh, 0ah, 0

.code
;//---------------------------------------------------------------------------------------------------------------------
;//This function sets startup screen
     start_setup PROC
                   
          push edx
          push eax
     
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

     start_setup ENDP
END