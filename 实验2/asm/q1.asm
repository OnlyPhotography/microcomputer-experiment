DATA   SEGMENT
  org  2000h
  str1  db   'AeHdc123!*sLdeDIO71ok',0AH,0DH,'$'
  count equ   $-str1
  org  2030h
  str2  db    count dup(?)      ;��Ŵ������ַ���
  num   db    ?                 ;��Ŵ�д��ĸ��ͳ�Ƹ���        
  
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT 
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX
        MOV CX,count
        XOR DX,DX
        LEA SI,str1
        LEA DI,str2        
NEXT:   MOV AL,[SI]
        CMP AL,'A'      ;С��A��ת��
        JB WONTCG 
        CMP AL,'Z'      ;����Z��ת��
        JA WONTCG       
        ADD AL,20H      ;��A-Z�еļ���20H
        INC DL          ;ͳ�ƴ�д��ĸ����
WONTCG: MOV [DI],AL
        INC SI
        INC DI               
        LOOP NEXT
        LEA DI,num      
        MOV [DI],DL     ;�洢��д��ĸ����
        LEA DX,str1     ;���ԭ�ַ���
        MOV AH,09H
        INT 21H
        LEA DX,str2     ;����޸ĺ���ַ���
        MOV AH,09H
        INT 21H
CODE    ENDS
        END START






