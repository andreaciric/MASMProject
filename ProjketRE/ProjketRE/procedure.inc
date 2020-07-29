.386
.model flat, stdcall

;//---------------------------------------------------------------------------------------------------------------------
;// This procedure generates a random four element array with different values [1,4]

random_array PROTO,
                    Arr: PTR BYTE,
                    ArrSetup: PTR BYTE,
                    indicator: BYTE

;//---------------------------------------------------------------------------------------------------------------------
;// This procedure draws a square in given color at given starting position

draw_square PROTO,
                    xposition: BYTE,
                    yposition: BYTE,
                    color: PTR BYTE,
                    k: PTR DWORD

;//---------------------------------------------------------------------------------------------------------------------
;//This procedure sets parameters for all four squares  and calls draw_square procedure for each square

draw_squares PROTO,
                    Arr: PTR BYTE,  
                    OutArr: PTR BYTE

;//---------------------------------------------------------------------------------------------------------------------
;//This procedure generates a true answer (AnswerArr)

true_answer PROTO,
                         Arr: PTR BYTE,              
                         OutArrColors: PTR BYTE,
                         AnswerArr: PTR BYTE

;//---------------------------------------------------------------------------------------------------------------------
;//This procedure reads input and compares it with real (true) answers

get_answer PROTO,
                         Arr: PTR BYTE,
                         indicator: PTR BYTE

;//---------------------------------------------------------------------------------------------------------------------
;//This function sets startup screen with game instructions

start_screen PROTO

;//---------------------------------------------------------------------------------------------------------------------
;//This function sets example screen

example_screen PROTO,
                    Arr: PTR BYTE, 
                    OutArrColors: PTR BYTE,
                    ArrSetup : PTR BYTE,
                    assign_array_indicator: BYTE
     
;//---------------------------------------------------------------------------------------------------------------------
;//This function sets game screen

game_screen PROTO,
                         Arr: PTR BYTE, 
                         OutArrColors: PTR BYTE,
                         ArrSetup : PTR BYTE,
                         score: DWORD

;//---------------------------------------------------------------------------------------------------------------------