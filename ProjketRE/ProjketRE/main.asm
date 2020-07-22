.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
     ; variables are here

.code
     main proc
          ; code is here



          invoke ExitProcess, 0
     main endp

end main