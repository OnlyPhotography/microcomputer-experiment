DATA   SEGMENT
  org  2000h
  num  dw 23333
  org  2010h
  res  db 5 dup(?),'$'
DATA   ENDS

STACK  SEGMENT PARA STACK 'STACK'
  DB 100 DUP (?)
STACK  ENDS

CODE   SEGMENT
       ASSUME CS:CODE,DS:DATA,SS:STACK
START:  MOV AX,DATA
        MOV DS,AX
; ��ʼ��ֵ
        LEA SI,res
        ADD SI,4H
        MOV CX,4H
        MOV AX,[num]
        MOV BX,0AH
NEXT:   XOR DX,DX       ; ��DX��CF����
        DIV BX          ; ��10ȡ��
        ADD DL,30H      ; ������޸�Ϊ��Ӧ��ASCII��
        MOV [SI],DL     ; �ѽ�����浽res
        DEC SI
        LOOP NEXT
; ����ʣ��һλ��Ҳ����AL
        ADD AL,30H
        MOV [SI],AL
        LEA DX,res
        MOV AH,09H      ; ����������Ļ
        INT 21H
CODE    ENDS
        END START
