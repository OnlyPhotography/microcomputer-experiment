DATA   SEGMENT
  org    2000h
  NUM1   db     12h,95h,0f1h,0c2h,82h,2h,10h,34h
  COUNT  equ    $-num1
  org    2010h
  NUM2   db     23h,0dfh,23h,3fh,3ch,0b3h,57h,3h
  org    2020h
  res    dB COUNT dup(0)
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX
        XOR AX,AX                 ;AX=0,CF=0
        MOV CX,COUNT           
        MOV SI,0
MY:     MOV AL,[2000H][SI]        ;ȡNUM1��SI��Ԫ��
        ADD AL,[2010H][SI]        ;ȡNUM2��SI��Ԫ�غ�ȡNUM1��SI��Ԫ�����
        MOV [2020H][SI],AL        ;�����֮��Ľ����res��SI��
        INC SI                    ;SI+1
        LOOP MY
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START






