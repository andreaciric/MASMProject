INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data
     temp BYTE 0

.code

    get_answer PROC,
                         Arr: PTR BYTE,                ;//pointer to given arraySetup
                         OutArrColors: PTR BYTE,
                         AnswerArr: PTR BYTE
     ;//-----------------------------------------------------------------------------
          pushad

          mov esi, 1
          mov eax, Arr
          mov ecx, OutArrColors
          mov ebx, AnswerArr

    again:
          mov edx, [ecx]
          movzx edi, dl
                    
          cmp edi, 1h
          jz b

          cmp edi, 2h
          jz g

          cmp edi, 4h
          jz r

          cmp edi, 0Eh
          jz y

     b:
          mov edx, [eax]
          mov [ebx], dl
          jmp next

     g:
          add eax, 1
          mov edx, [eax]
          mov [ebx], dl
          jmp next

     r:
          add eax, 2
          mov edx, [eax]
          mov [ebx], dl
          jmp next

     y:
          add eax, 3
          mov edx, [eax]
          mov[ebx], dl
          jmp next

     next:

          mov eax, Arr
          inc ebx
          inc ecx
          inc esi
          cmp esi, 5
          jnz again

          popad
          ret
     get_answer ENDP

END