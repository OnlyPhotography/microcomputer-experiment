;sample ˳��ṹ ��0~9ƽ����
        DATA   SEGMENT		;���ݶζ���
        TABLE 	DB 	0,1,4,9,16,25,36,49,64,81	;ƽ������
        XX     	DB 	5
        YY     DB 	?						;��Ų����
        DATA   ENDS
        
        STACK  SEGMENT PARA STACK 'STACK'	;��ջ�ζ���
               DB 100 DUP (?)
        STACK  ENDS
        
        CODE   SEGMENT		;����ζ���
               ASSUME CS:CODE,DS:DATA
        START: MOV AX,DATA
               MOV DS,AX 		;װ�ضε�ַ
               MOV AL,XX
               MOV BX,OFFSET TABLE
               XLAT
              MOV YY,AL
               MOV AH,4CH
               INT 21H         	;�������򲢷���dos
CODE   ENDS
                 END START

