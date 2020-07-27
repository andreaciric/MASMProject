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

