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

.data?

     arrayGame BYTE n dup(?)          ;//niz brojeva dodeljivanih u toku igre za random redosled kvadrata
     arraySetup BYTE n dup(?)          ;//inicijalna dodela brojeva bojama

     .code
          main PROC
               INVOKE random_array, OFFSET ArrayGame, OFFSET ArraySetup, assign_array_indicator
               INVOKE ExitProcess, 0

     main ENDP
END main