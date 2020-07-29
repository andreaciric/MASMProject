INCLUDE Irvine32.inc
INCLUDE procedure.inc

.data
     temp BYTE 0

.code

;//--------------------------------------------------------------------------------------------------
;//This procedure generates a true answer (AnswerArr)

    true_answer PROC,
                         Arr: PTR BYTE,              
                         OutArrColors: PTR BYTE,
                         AnswerArr: PTR BYTE
;//--------------------------------------------------------------------------------------------------
          pushad

          mov esi, 1
          mov eax, Arr
          mov ecx, OutArrColors
          mov ebx, AnswerArr

    again:
          mov edx, [ecx]
          movzx edi, dl

          ;//determines what color it is
          
          cmp edi, 1h
          jz b

          cmp edi, 2h
          jz g

          cmp edi, 4h
          jz r

          cmp edi, 0Eh
          jz y

          ;//determines which number is assigned to that color

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
     true_answer ENDP

;//--------------------------------------------------------------------------------------------------
;//This procedure reads input and compares it with real (true) answers
     get_answer PROC,
                         Arr: PTR BYTE,
                         indicator: PTR BYTE
;//--------------------------------------------------------------------------------------------------

          pushad

          mov esi, 1
          mov ebx, Arr

     again:
          mov ecx, [ebx]
          movzx edx, cl
          call ReadInt
          cmp eax, edx
          jne end_false
          mov ecx, indicator
          mov edi, 1
          mov [ecx], edi
          inc ebx
          inc esi
          cmp esi, 5
          jne again
          jmp the_end

     end_false:
          mov ecx, indicator
          mov edi, 0
          mov [ecx], edi

     the_end:          

          popad
          ret
     get_answer ENDP

END