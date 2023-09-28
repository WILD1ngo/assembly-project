GRAPHIC_MODE MACRO
    ; Clear screen by entering graphic mode  40*25
	mov ax, 13h
	int 10h	
ENDM
GRAPHIC_MODE2 MACRO
    MOV AX, 0003h
    MOV BX, 0000h
    MOV DX, 0000h
    INT 10H
ENDM
SET_BG_COLOR MACRO X
    MOV AX,0600h 
    MOV BH,X   
    MOV CX,0000h  
    MOV DX,184Fh  
    INT 10h
ENDM
CURS_OFF macro
	MOV     CH, 10h         
	MOV     AH, 01H         
	INT     10h             
endm
WAIT_TOUCH MACRO
; Wait for character
	mov ah, 0h
	int 16h	
ENDM
SET_CUR MACRO X,Y
    mov ah, 2
    mov bh, 0
    mov dh, Y
    mov dl, X
    int 10h
ENDM

PRINT MACRO MSG
    push ax ; push the value of ax into the stack
    push dx ; push the value of dx into the stack
    lea dx, [MSG]
    mov ah, 09h
    int 21h
    pop dx ; remove it from the stack
    pop ax ; remove it from the stack
ENDM 

;print main page
DRAw_GAME MACRO
GRAPHIC_MODE2
SET_BG_COLOR 3
CURS_OFF

print pinfree
print pin1
print pin2
print pin3
print pin4
print pin5
print pin6
print pin7
print pin8
print pin9
print pina
print pinc


ENDM
DRAw_LEVEL1 MACRO
GRAPHIC_MODE2
SET_BG_COLOR 5
CURS_OFF

print PINL1
print pin1
print pin2
print pin3
print pin4
print pin5
print pin6
print pin7
print pin8
print pin9
print pina
print pinB


ENDM
DRAw_LEVEL2 MACRO
GRAPHIC_MODE2
SET_BG_COLOR 4
CURS_OFF

print PINL2
print pin1
print pin2
print pin3
print pin4
print pin5
print pin6
print pin7
print pin8
print pin9
print pina
print pinB


ENDM

DRAw_MAIN MACRO 


SET_BG_COLOR 8 ; GREEN Theme

SET_CUR 6 8 ; Move Cursor to X=10,Y=10
PRINT student

; play button
SET_CUR 6 12 ; Move Cursor to X=10,Y=5
PRINT emptyline2
SET_CUR 6 10 ; Move Cursor to X=10,Y=5
PRINT emptyline2
SET_CUR 6 11 ; Move Cursor to X=10,Y=9
PRINT msgA

;help button
SET_CUR 6 14 ; Move Cursor to X=10,Y=5
PRINT emptyline2
SET_CUR 6 16; Move Cursor to X=10,Y=5s
PRINT emptyline2
SET_CUR 6 15 ; Move Cursor to X=10,Y=9
PRINT msgB

;quit button
SET_CUR 6 18 ; Move Cursor to X=10,Y=5
PRINT emptyline2
SET_CUR 6 20 ; Move Cursor to X=10,Y=5
PRINT emptyline2
SET_CUR 6 19 ; Move Cursor to X=10,Y=9
PRINT msgC

SET_CUR 9 5 ; Move Cursor to X=10,Y=5
PRINT gametitle
SET_CUR 9 4 ; Move Cursor to X=10,Y=5
PRINT emptyline
SET_CUR 9 6 ; Move Cursor to X=10,Y=5
PRINT emptyline

ENDM

Print_WIN_SCREEN MACRO
GRAPHIC_MODE2
SET_BG_COLOR 4
SET_CUR 0 2
print WIN_screen1
print WIN_screen0
print WIN_screen2
print WIN_screen3
print WIN_screen4
print WIN_screen5
print WIN_screen6
print WIN_screen7
print WIN_screen8
print WIN_screen9
print WIN_screen10
print WIN_screen0
print WIN_screen0
print WIN_screen11
print WIN_screen12

ENDM
DRAW_NEXT_LEVEL MACRO
GRAPHIC_MODE
SET_BG_COLOR 3

SET_CUR 0 2 
print NEXT_LEVEL

WAIT_TOUCH
ENDM
Print_LOSE_SCREEN MACRO
GRAPHIC_MODE
SET_BG_COLOR 8

SET_CUR 0 2 
print LOSE_SCREEN

ENDM
INSTRACTION_MENU MACRO
GRAPHIC_MODE
SET_BG_COLOR 7

SET_CUR 0 4 
print instractions

ENDM

WAITD macro
mov cx, 03h   ;High Word
mov dx, 4240h   ;Low Word
mov al, 0
mov ah, 86h  ;Wait
int 15h
endm



WAIT_FOR_BUTTON MACRO
    ; waits for character
    mov ah, 0h
    int 16h
    mov [chr1], al    ; save character to [chr1]
ENDM
playS macro x
 MOV     AX, x       
 MOV     [STOR], AX
 CALL    SOUNDER
 WAITD
endm


playL1 macro
playS 1521
playS 1809
playS 1809
playS 1715
playS 2031
playS 2031
playS 2280
playS 2031
playS 1809
playS 1715
playS 1521
playS 1521
playS 1521
endm


playL2 macro
playS 1809
playS 1917
playS 1809
playS 1917
playS 1809
playS 1207
playS 1015
playS 1140
playS 1355
waitd
playS 2280
playS 1809
playS 1355
playS 1207
waitd
playS 1809
playS 1355
playS 1207
playS 1140
endm

IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
CHOICE_INPUT_NUMBER DB 0
welcome   db ' welcome ',10,13,'$'
student	db ' MADE BY: yoav mateless  ' ,10,13,'$'
		 
msgA        db '   press P - Play        ' ,10,13,'$'
msgB        db '   press H - Help        ' ,10,13,'$'
msgC        db '   press Q - Quit        ' ,10,13,'$'
emptyline2  db '                         ' , 10, 13, '$'
		
gametitle  db ' VISUAL HEARING GAME ' , 10, 13, '$'
emptyline  db '                     ' , 10, 13, '$'
				  
instractions db '             instractions               ', 10, 13
			db	'                                        ', 10, 13
			db	'    play on the piano the same song     ', 10, 13
			db	'    you hear. to hear                   ', 10, 13
			db	'    the song you can press V            ', 10, 13
			db	'    Remmber if you lose you go back to  ', 10, 13
			db	'    level 1                             ', 10, 13
			db	'    and stay on English lower caps      ', 10, 13
			db	'                                        ', 10, 13
			db	'   p-play                     q-quit    ', 10, 13, '$'
			
Next_level db   '         you finish this level         ', 10, 13
			db	'                                       ', 10, 13
			db	'                                       ', 10, 13
			db	'        press any button to            ', 10, 13
			db	'              continue                 ', 10, 13
			db	'                                       ', 10, 13
			db	'                                       ', 10, 13
			db	'                                       ', 10, 13
			db	'                                       ', 10, 13
			db	'                                       ', 10, 13, '$'
WIN_screen0                                                        db  '                                                                    ', 10, 13
WIN_screen1                                                        db  '                              you WON!!!!!                          ', 10, 13
WIN_screen2		    	                                           db  '                    	     ___________                            ',10,13
WIN_screen3                                                        db  '  	                        "._==_==_=_."                           ',10,13
WIN_screen4                                                        db  '  	                        .-\:      /-.                           ',10,13
WIN_screen5                                                        db  '         	               | (|:.     |) |                          ',10,13
WIN_screen6                                                        db  '  	                        "-|:.     |-"                           ',10,13
WIN_screen7                                                        db  '  	                          \::.    /                             ',10,13
WIN_screen8                                                        db  '  	                           "::. ."                              ',10,13
WIN_screen9                                                        db  '  	                             ) (                                ',10,13
WIN_screen10                                                       db  '                               _." "._                              ',10,13
WIN_screen11                                                 	   db  '                       MADE BY YOAV MATELESS                        ', 10, 13
WIN_screen12			                                           db  '                    THANKS FOR PLAYING  q-quit                      ', 10, 13, '$'
			
LOSE_SCREEN db   '          YOU LOST!!                   ', 10, 13
			db	'                                        ', 10, 13
			db	'       wait you already know it         ', 10, 13
			db	'                  LOL                   ', 10, 13
			db	'                                        ', 10, 13
			db	'                                        ', 10, 13
			db	'    press v to go to free style piano   ', 10, 13
			db	'                                        ', 10, 13
			db	'                                        ', 10, 13
			db	'                                        ', 10, 13, '$'
 
    PINFREE db 13,10,                                                  '           FREE PIANO                                               '      , '$'    
    PINL1 db 13,10,                                                    '           LEVEL: 1 - The Small Yonatan                             '      , '$'      	
	PINL2 db 13,10,                                                    '           LEVEL: 2 - fur elise                                     '      , '$'  
    PIN1 db 13,10,                                                     '           _________________________________________________________'      , '$'                  
    PIN2 db 13,10,                                                     '           X+++++++++++++++++++++++++++++++++++++++++++++++++++++++X'     , '$'
    PIN3 db 13,10,                                                     '           X       |  | | | |  |  | | | | | |  |  | | | |  |       X'            , '$'                   
    PIN4 db 13,10,                                                     '           X       |  | | | |  |  | | | | | |  |  | | | |  |       X'           , '$'                     
    PIN5 db 13,10,                                                     '           X       |  |2| |3|  |  |5| |6| |7|  |  |9| |0|  |       X'          , '$'                   
    PIN6 db 13,10,                                                     '           X       |  |_| |_|  |  |_| |_| |_|  |  |_| |_|  |       X'           , '$'                     
    PIN7 db 13,10,                                                     '           X       |   |   |   |   |   |   |   |   |   |   |       X'           , '$'                     
    PIN8 db 13,10,                                                     '           X       | q | w | e | r | t | y | u | i | o | p |       X'            , '$'
    PIN9 db 13,10,                                                     '           X       |___|___|___|___|___|___|___|___|___|___|       X'           , '$'                     
    PIN0 db 13,10,                                                     '           X                                                       X'           , '$'                     
    PINA db 13,10,                                                     '           XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'            , '$'
    PINB db 13,10,                                                     '                             Press v to Play Again                  '          , '$'
    PINc db 13,10,                                                     '                             Press v to Start Level 1               '          , '$'	
	
	
	
	


	chr1 db 0
	
	
	STOR    DW 0        ;MEMORY    
    INPUT   DB 128



CODESEG
 
;------------------------------------------------------------------

PROC CLR_KEYB
    PUSH    AX              ; Push AX register onto the stack
    MOV     AX, 40H         ; Move 40H (segment address of the BIOS data area) into AX
    MOV     ES, AX          ; Move the value of AX into ES register
    MOV     AX, 1AH         ; Move 1AH into AX
    MOV     DI, AX          ; Move the value of AX into DI register
    MOV     AX, 1EH         ; Move 1EH into AX
    MOV     [ES:DI], AX     ; Store the value of AX at the address [ES:DI]
    ADD     DI, 2           ; Add 2 to DI to move to the next memory location
    MOV     [ES:DI], AX     ; Store the value of AX at the address [ES:DI]
    POP     AX              ; Pop the value from the stack into AX register
    RET                     ; Return from the procedure
ENDP CLR_KEYB
PROC SOUNDER 
       MOV     AL, 0B6H        
       OUT     43H, Al         
       MOV     AX, [STOR]        
       OUT     42H, AL         
       MOV     AL, AH          
       OUT     42H, AL         
       IN      AL, 061H        
       OR      AL, 03H         
       OUT     61H, AL         
       CALL    DELAY           
       AND     AL, 0FCH        
       OUT     61H, AL         
       CALL    CLR_KEYB        
       RET
ENDP SOUNDER 
DELAY:
       MOV     AH, 00H         
       INT     01AH            
       ADD     DX, 4           
       MOV     BX, DX          
PROC pz 
            INT     01AH            
            CMP     DX, BX          
            JL      PZ              
       RET
ENDP pz


start:
	mov ax, @data
	mov ds, ax
	
; --------------------------

; print opening welcome
print welcome
WAIT_TOUCH
GRAPHIC_MODE

DRAw_MAIN
not_play:

WAIT_FOR_BUTTON
CMP [chr1] , 'q'
JnE not_End_game

;return to text mode   80* 25
    mov ax, 2h
    int 10h
mov ax, 4c00h
    int 21h
not_End_game:


;return to text mode   80* 25
CMP [chr1] , 'h'
JnE not_instraction

INSTRACTION_MENU

not_instraction:


CMP [chr1] , 'p'
JnE not_play

main:   
DRAw_GAME


GETIN:
            MOV AH, 08H        ;SCAN IMPUT USER
            MOV [INPUT], AL
            INT 21H
            JMP X
                NDO:
                    MOV     AX, 2280     
                    MOV     [STOR], AX
                    CALL    SOUNDER       
                    JMP GETIN  
                
                NRE:
                    MOV     AX, 2031        
                    MOV     [STOR], AX
                    CALL    SOUNDER       
                    JMP GETIN
                    
                NMI:
                    MOV     AX, 1809      
                    MOV     [STOR], AX
                    CALL    SOUNDER      
                    JMP GETIN
                    
                NFA:
                    MOV     AX, 1715  
                    MOV     [STOR], AX
                    CALL    SOUNDER       
                    JMP GETIN
                    
                NSOL:
                    MOV     AX, 1521    
                    MOV     [STOR], AX
                    CALL  SOUNDER        
                    JMP GETIN
                    
                NLA:
                    MOV     AX, 1355       
                    MOV     [STOR], AX
                    CALL    SOUNDER        
                    JMP GETIN
                    
                NSI:
                    MOV     AX, 1207      
                    MOV     [STOR], AX
                    CALL SOUNDER       
                    JMP GETIN
                    
                NDOH:
                    MOV     AX, 1140       
                    MOV     [STOR], AX
                    CALL    SOUNDER       
                    JMP GETIN
                    
                NREH:
                    MOV     AX, 1015      
                    MOV     [STOR], AX
                    CALL    SOUNDER     
                    JMP GETIN
                
                NMIH:
                    MOV     AX, 0905    
                    MOV     [STOR], AX
                    CALL    SOUNDER         
                    JMP GETIN
            
            X:
            
            CMP AL,"q"        
            JE NDO
            
            CMP AL,"2"         
            JE NDOS
            
            CMP AL,"w"         
            JE NRE
            
            CMP AL,"3"       
            JE NRES
            
            CMP AL,"e"        
            JE NMI
            
            CMP AL,"r"        
            JE NFA
            
            CMP AL,"t"         
            JE NSOL
            
            CMP AL,"y"         
            JE NLA
            
            CMP AL,"u"         
            JE NSI 
            
            CMP AL,"i"         
            JE NDOH
            
            CMP AL,"o"         
            JE NREH
            
            CMP AL,"p"        
            JE NMIH
            
            JMP Y
            
            NDOS:
                    MOV     AX, 2152     
                    MOV     [STOR], AX
                    CALL    SOUNDER        
                    JMP Y
                    
            NRES:
                    MOV     AX, 1917     
                    MOV     [STOR], AX
                    CALL    SOUNDER      
                    JMP Y
                    
            NFAS:
                    MOV     AX, 1612    
                    MOV     [STOR], AX
                    CALL    SOUNDER  
                    JMP Y
            
            NSOLS:
                    MOV     AX, 1436        
                    MOV     [STOR], AX
                    CALL    SOUNDER      
                    JMP Y
            
            NLAS:
                    MOV     AX, 1292    
                    MOV     [STOR], AX
                    CALL    SOUNDER       
                    JMP Y
            
            NDOHS:
                    MOV     AX, 1076    
                    MOV     [STOR], AX
                    CALL    SOUNDER        
                    JMP Y
            
            NREHS:
                    MOV     AX, 0958         
                    MOV     [STOR], AX
                    CALL   SOUNDER    
                    JMP Y              
                          
            Y :
            
            CMP AL,"2"         
            JE NDOS
            
            CMP AL,"3"         
            JE NRES
            
            CMP AL,"5"         
            JE NFAS
            
            CMP AL,"6"         
            JE NSOLS
            
            CMP AL,"7"         
            JE NLAS
            
            CMP AL,"9"         
            JE NDOHS
            
            CMP AL,"0"         
            JE NREHS
            
            CMP AL,"v"      
            JE level1
            JMP GETIN      ;LOOPING


level1:
DRAw_LEVEL1

t1:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL1
jmp o1
pl1:
playL1
jmp t1
o1:
CMP [chr1] , 't'
je p13
jmp lose
p13:
playS 1521

t2:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL2
jmp o2
pl2:
playL1
jmp t2
o2:
CMP [chr1] , 'e'
je p12
jmp lose
p12:
playS 1809

t3:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL3
jmp o3
pl3:
playL1
jmp t3
o3:
CMP [chr1] , 'e'
je p11
jmp lose
p11:
playS 1809

t4:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL4
jmp o4
pl4:
playL1
jmp t4
o4:
CMP [chr1] , 'r'
je p10
jmp lose
p10:
playS 1715

t5:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL5
jmp o5
pl5:
playL1
jmp t5
o5:
CMP [chr1] , 'w'
je p9
jmp lose
p9:
playS 2031

t6:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL6
jmp o6
pl6:
playL1
jmp t6
o6:
CMP [chr1] , 'w'
je p8
jmp lose
p8:
playS 2031

t7:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL7
jmp o7
pl7:
playL1
jmp t7
o7:
CMP [chr1] , 'q'
je p7
jmp lose
p7:
playS 2280

t8:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
jE pL8
jmp o8
pl8:
playL1
jmp t8
o8:
CMP [chr1] , 'w'
je p6
jmp lose
p6:
playS 2031

t9:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL9
jmp o9
pl9:
playL1
jmp t9
o9:
CMP [chr1] , 'e'
je p5
jmp lose
p5:
playS 1809

t10:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL10
jmp o10
pl10:
playL1
jmp t10
o10:
CMP [chr1] , 'r'
je p4
jmp lose
p4:
playS 1715

t11:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL11
jmp o11
pl11:
playL1
jmp t11
o11:
CMP [chr1] , 't'
je p3
jmp lose
p3:
playS 1521

t12:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL12
jmp o12
pl12:
playL1
jmp t12
o12:
CMP [chr1] , 't'
je p2
jmp lose
p2:
playS 1521

t13:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL13
jmp o13
pl13:
playL1
jmp t13
o13:
CMP [chr1] , 't'
je p1
jmp lose
p1:
playS 1521

DRAW_NEXT_LEVEL

level2:
DRAw_LEVEL2

c1:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL21
jmp r1
pl21:
playL2
jmp c1
r1:
CMP [chr1] , 'e'
je d1
jmp lose
d1:
playS 1809

c2:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL22
jmp r2
pl22:
playL2
jmp c2
r2:
CMP [chr1] , 33h
je d2
jmp lose
d2:
playS 1917

c3:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL23
jmp r3
pl23:
playL2
jmp c3
r3:
CMP [chr1] , 'e'
je d3
jmp lose
d3:
playS 1809

c4:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL24
jmp r4
pl24:
playL2
jmp c4
r4:
CMP [chr1] , 33h
je d4
jmp lose
d4:
playS 1917

c5:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL25
jmp r5
pl25:
playL2
jmp c5
r5:
CMP [chr1] , 'e'
je d5
jmp lose
d5:
playS 1809

c6:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL26
jmp r6
pl26:
playL2
jmp c6
r6:
CMP [chr1] , 'u'
je d6
jmp lose
d6:
playS 1207

c7:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL27
jmp r7
pl27:
playL2
jmp c7
r7:
CMP [chr1] , 'o'
je d7
jmp lose
d7:
playS 1015

c8:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL28
jmp r8
pl28:
playL2
jmp c8
r8:
CMP [chr1] , 'i'
je d8
jmp lose
d8:
playS 1140

c9:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL29
jmp r9
pl29:
playL2
jmp c9
r9:
CMP [chr1] , 'y'
je d9
jmp lose
d9:
playS 1355

c10:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL210
jmp r10
pl210:
playL2
jmp c10
r10:
CMP [chr1] , 'q'
je d10
jmp lose
d10:
playS 2280

c11:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL211
jmp r11
pl211:
playL2
jmp c11
r11:
CMP [chr1] , 'e'
je d11
jmp lose
d11:
playS 1809

c12:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL212
jmp r12
pl212:
playL2
jmp c12
r12:
CMP [chr1] , 'y'
je d12
jmp lose
d12:
playS 1355


c13:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL213
jmp r13
pl213:
playL2
jmp c13
r13:
CMP [chr1] , 'u'
je d13
jmp lose
d13:
playS 1207

c14:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL214
jmp r14
pl214:
playL2
jmp c14
r14:
CMP [chr1] , 'e'
je d14
jmp lose
d14:
playS 1809

c15:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL215
jmp r15
pl215:
playL2
jmp c15
r15:
CMP [chr1] , 'y'
je d15
jmp lose
d15:
playS 1355

c16:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL216
jmp r16
pl216:
playL2
jmp c16
r16:
CMP [chr1] , 'u'
je d16
jmp lose
d16:
playS 1207

c17:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JE pL217
jmp r17
pl217:
playL2
jmp c17
r17:
CMP [chr1] , 'i'
je d17
jmp lose
d17:
playS 1140

Print_WIN_SCREEN
notEnd:
WAIT_FOR_BUTTON
CMP [chr1] , 'q'
Je quit2
jmp notEnd
quit2:
;return to text mode   80* 25
    mov ax, 2h
    int 10h
mov ax, 4c00h
    int 21h



lose:
Print_LOSE_SCREEN
upv3:
WAIT_FOR_BUTTON
CMP [chr1] , 'v'
JnE upv3
jmp main


mov ax, 2h
int 10h


; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start