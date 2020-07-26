.386
.model flat, stdcall

random_array PROTO,
                    Arr: PTR BYTE,
                    ArrSetup: PTR BYTE,
                    indicator: BYTE


draw_square PROTO,
                    xposition: BYTE,
                    yposition: BYTE,
                    color: PTR BYTE

draw_squares PROTO,
                    Arr: PTR BYTE