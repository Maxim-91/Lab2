        .386
        .model flat,stdcall
  option   casemap:none
                        include D:\masm32\INCLUDE\WINDOWS.INC
                        include D:\masm32\INCLUDE\KERNEL32.INC 
                        include D:\masm32\INCLUDE\USER32.INC
                        include D:\masm32\INCLUDE\ADVAPI32.INC                                                  
                                                                     
                        includelib D:\masm32\lib\comctl32.lib
                        includelib D:\masm32\lib\user32.lib
                        includelib D:\masm32\lib\gdi32.lib
                        includelib D:\masm32\lib\kernel32.lib                
                        includelib D:\masm32\lib\user32.lib
                        includelib D:\masm32\lib\advapi32.lib                 
;###########################################################
;data--data--data--data--data--data--data--data--data--data--     PROC
;------------------------------------------------------------
.DATA
X       DWORD          ?
Y       DWORD          ?
Z       DWORD          ?
W       DWORD          ?
Q       DWORD          ?
A       DWORD          ?
E       DWORD          ?
R       DWORD          ?
String_CAPTION                DB    "Виконання 2 частини самостійної роботи - Котлубаєв М.Є.",0
String_SHABLON                DB     "Число %d: а) %d, б) %d, d) %d, г) %d.",0
String_CONTENER               DB      256  dup (0)
;##############################################################
;code--code--code--code--code--code--code--code--code--code-- PROC
;---------------------------------------------------------------------------------------------------
.CODE
START:  
             MOV      X ,  195   
             MOV      Y ,  100     
             MOV      Z ,  10     
             MOV      W ,  0     
             MOV      Q ,  0    
             MOV      A ,  0    
             MOV      E ,  0     
             MOV      R ,  0                
             ;-------------- a), б) 
             MOV EDX, 0 
             MOV EAX, X 
             MOV EBX, Y 
             DIV EBX 
             MOV Q, EDX    
             ;------------- 
             MOV EDX, 0 
             MOV EAX, Q 
             MOV EBX, Z 
             DIV EBX 
             MOV W, EAX ; вирішення завдання а)
             MOV Q, EDX ; вирішення завдання б)
             ;------------- в)
             MOV EDX,0  
             MOV EAX, X 
             MOV EBX, Y 
             DIV EBX 
             MOV Y ,  EAX 
             ;------------
             MOV EAX, Q
             MOV EDI, W
             MOV ESI, Y
             ADD EAX, EDI
             ADD EAX, ESI
             MOV A, EAX
             ;------------ г)
             MOV EAX,Q
             MOV EBX, 6
             MUL EBX
             MOV R,EAX
             MOV EAX,X
             MOV EBX,100
             MOV EDX,0
             DIV EBX
             MOV E,EAX
             MOV EAX,R
             MOV EBX,E
             MUL EBX
             MOV E,EAX
       ;------------------------------------------------------------------
      invoke   wsprintf    ,\
      		   addr      String_CONTENER  ,\    ; БУФЕР
      		   addr      String_SHABLON    , \   ; ФОРМАТ
                   X   ,\     		   
                   Q   ,\
      		   W   ,\
      		   A   ,\  
                   E   	
        ;----------------------------------------------------------------- 
mov   EDI    ,  offset   String_CONTENER
  	mov  ESI     ,   offset   String_CAPTION
        
invoke   MessageBox   ,  0 , EDI  ,\
         				     			 ESI   ,\ 
         				    		      0    
          ;------------------------------------------------------
EXIT:     
             invoke               ExitProcess        ,       0
;++++++++++++++++++++++++++++++++++++++++++++
END  START