DATA   SEGMENT
  org  2000h
  num  dw 78CDh
  org  2010h
  res  db 4 dup(?),'$'
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
        ADD SI,3H
        MOV AX,[num]
        MOV BX,10H
        MOV CX,3H
NEXT:   XOR DX,DX       ; ��dx��cf����
        DIV BX          ; ��16ȡ����
        CMP DL,0AH      ; �ж������ֻ�����ĸ
        JAE LETTER
        ADD DL,30H      ; ���ּ�30H
        JMP SAVE
LETTER: ADD DL,37H      ; ��ĸ��37H
SAVE:   MOV [SI],DL     ; ���޸ĺ��ASCII��浽res
        DEC SI
        LOOP NEXT
; ����ʣ���һλ��Ҳ����AL��Ӧ������
        XOR DX,DX
        CMP AL,0AH
        JAE LETTERA
        ADD AL,30H
        JMP SAVEA
LETTERA:ADD AL,37H
SAVEA:  MOV [SI],AL
        LEA DX,res
        MOV AH,09H      ; ������
        INT 21H
CODE    ENDS
        END START
