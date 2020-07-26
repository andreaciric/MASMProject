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
     score BYTE 0

.data?

     arrayGame BYTE n dup(?)          ;//niz brojeva dodeljivanih u toku igre za random redosled kvadrata
     arraySetup BYTE n dup(?)          ;//inicijalna dodela brojeva bojama

     .code
          main PROC
          again:
               INVOKE start_setup
               INVOKE random_array, OFFSET arrayGame, OFFSET arraySetup, assign_array_indicator
               INVOKE example_page, OFFSET arraySetup
               
               INVOKE ExitProcess, 0

     main ENDP
END main