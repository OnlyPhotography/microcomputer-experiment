DATA   SEGMENT
BUFF   DB 79H,98H,23H,67H,0A8H
MAX    DB ?
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
       DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START: MOV AX,DATA
       MOV DS,AX
       MOV   CX,5           ; CX��Ϊ������
       LEA   SI,BUFF        ; ȡBUFF��ַ��SI
       MOV   AL,[SI]        ; ����һ����79H)��ֵ��AL
       DEC   CX             
       INC   SI             ; SI��1
LP:    CMP   AL,[SI]        ; �Ƚ�AL��ƫ�Ƶ�ַSI��Ӧ�ĵ���ֵ
       JGE   G1             ; �ж�SF���OF�Ƿ�Ϊ0�����Ϊ0����[SI]<=AL,��ת�Ƶ�G1
       MOV   AL,[SI]        ; ��[SI]����AL������°�[SI]��ֵ��AL
G1:    INC   SI             ;      
       LOOP  LP             ; ��CX��0��ʱ��ת�Ƶ�LP��ֱ��CX=0
       MOV   MAX,AL         
       MOV   AH,4CH
       INT   21H
 CODE  ENDS
       END START



