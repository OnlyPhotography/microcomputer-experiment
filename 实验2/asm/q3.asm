; Ҫ�󣺽��������ݶε����ݣ�����Ļ����ʾ

DATA   SEGMENT
   time   db  2,0,2,0,0,4,2,1
   str1    db  'Happy New Day!$'
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX 
        MOV CX,8
        LEA SI,time
NEXT1:  MOV DL,[SI]
        ADD DL,30H
        MOV AH,02H
        INT 21H
        INC SI           
        LOOP NEXT1
        LEA DX,str1
        MOV AH,09H
        INT 21H        
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START






