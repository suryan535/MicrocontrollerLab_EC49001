

		ORG 8100H
		
		MOV DPTR,#0XE803
		MOV A,#80H
		MOVX @DPTR,A
		
		
		MOV DPTR,#9000H
		MOV A,#0X3F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X06
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X5B
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X4F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X66
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X6D
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X7D
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X07
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X7F
		MOVX @DPTR,A
		
		INC DPTR
		MOV A,#0X6F
		MOVX @DPTR,A

		MOV R5,#0

		DIGIT1_LOOP:
		    MOV DPTR,#0XE802
			MOV A,#8H
			MOVX @DPTR,A
			
			MOV DPTR,#9000H
			MOV DPL,R5
			MOVX A,@DPTR
			MOV DPTR,#0XE801
			MOVX @DPTR,A
			
			
			MOV R0,#10
			MOV DPTR,#9000H
			
			
			LOOP1:
			   
			   
			  
			   MOV R2,#127
			   LOOP01:
			   MOV R1,DPL
			   MOVX A,@DPTR
			   MOV DPTR,#0XE800
			   MOVX @DPTR,A

				   MOV DPTR,#0XE802
				   MOV A,#2H
				   MOVX @DPTR,A
			   
				
					MOV R3,#32
					LOOP02:
						MOV R4,#55
						LOOP03:
							DJNZ R4,LOOP03
						DJNZ R3,LOOP02
				
					MOV DPTR,#0XE802
					MOV A,#8H
					MOVX @DPTR,A
					
					MOV DPTR,#9000H
				MOV DPL,R5
				MOVX A,@DPTR
				MOV DPTR,#0XE800
				MOVX @DPTR,A
				
						MOV R3,#32
						LOOP05:
							MOV R4,#55
							LOOP06:
								DJNZ R4,LOOP06
							DJNZ R3,LOOP05
						DJNZ R2,LOOP01
				
				
				
				
				
				MOV DPTR,#9000H
				MOV DPL,R1
				INC DPTR
				
				DJNZ R0,LOOP1
			INC R5
			MOV A,R5
			MOV B,#3
			DIV AB
			MOV R5,B
				
			SJMP DIGIT1_LOOP
			
		END