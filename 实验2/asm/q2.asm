; Ҫ����һ���������ֽ������飬�����ֵ����Сֵ���ܺͺ�ƽ��ֵ��

DATA   SEGMENT
  org  2000h
  num   db    12h,95h,0f1h,0c2h,82h,2h,10h,34h
  count equ   $-num
  org  2010h
  sum   dw    ?
  res   db    3 dup(?)          ;���ֵ����Сֵ��ƽ��ֵ
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX
;�������Сֵ
        LEA SI,num
        MOV CX,count
        MOV BH,[SI]     
        MOV BL,[SI]     
        INC SI
        DEC CX    
CIR:    CMP BH,[SI]     
        JGE NEXT1
        MOV BH,[SI]
NEXT1:  CMP BL,[SI]
        JLE NEXT2
        MOV BL,[SI]
NEXT2:  INC SI
        LOOP CIR
        ;ѭ����ϣ��洢�����Сֵ
        LEA DI,res
        MOV [DI],BH     
        INC DI  
        MOV [DI],BL     
;������
        LEA SI,num
        XOR DI,DI
        XOR BX,BX
        MOV CX,count
SUMLP:  MOV AL,[SI]
        CBW
        CWD
        ADD BX,AX
        ADC DI,DX
        INC SI
        LOOP SUMLP      ;������
        LEA SI,sum
        MOV [SI],BX     ;�洢����sum
        MOV AX,BX
        MOV DX,DI
        MOV CX,count
        IDIV CX         ;������������
        LEA DI,res              
        MOV [DI][2],AL  ;�洢ƽ����          
        MOV AH,4CH
        INT 21H
CODE    ENDS
        END START









