.386
.model flat, stdcall

random_array PROTO,
                    Arr: PTR BYTE,
                    ArrSetup: PTR BYTE,
                    indicator: BYTE


draw_square PROTO,
                    xposition: BYTE,
                    yposition: BYTE,
                    color: PTR BYTE,
                    k: PTR dword

draw_squares PROTO,
                    Arr: PTR BYTE,  ;//pointer to given arrayGame
                    OutArr: PTR BYTE


start_screen PROTO


example_screen PROTO,
                    Arr: PTR BYTE,  ;//pointer to given arrayGame
                    OutArr: PTR BYTE

get_answer PROTO,
                         Arr: PTR BYTE,                ;//pointer to given arraySetup
                         OutArrColors: PTR BYTE,
                         AnswerArr: PTR BYTE
     
 game_screen PROTO,
                         Arr: PTR BYTE, ;//pointer to given arrayGame
                         OutArrColors: PTR BYTE