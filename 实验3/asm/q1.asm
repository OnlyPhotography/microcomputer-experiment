DATA   SEGMENT
        org  2000h
        num  db 23H
        org  2010h
        res  db 8 dup(?),'$'
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX
;��ʼ��ֵ
        LEA SI,res
        MOV AL,[num]
        MOV AH,0H
        MOV CL,10H
        DIV CL          ; ��79H�ֳ�7H��9H
        XCHG AH,AL      ; ����AL��AH��ʹ��AXΪ7H��9H
; ����AH
        MOV CX,4H
        ADD SI,3
HEIGHT: XOR BX,BX
        SHR AH,1        ; ����
        ADC BH,30H      ; ������޸�ΪASCII��
        MOV [SI],BH     ; ������
        DEC SI
        LOOP HEIGHT
; ����AL
        MOV CX,4H
        ADD SI,8
LOWER:  XOR BX,BX
        SHR AL,1        ; ����
        ADC BH,30H      ; ������޸�ΪASCII��
        MOV [SI],BH     ; ������
        DEC SI
        LOOP LOWER
; ����Ļ����ʾ���
        LEA DX,res
        MOV AH,09H
        INT 21H
CODE    ENDS
        END START











