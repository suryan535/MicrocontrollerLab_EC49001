

		ORG 8100H
			
			MOV DPTR,#0XE803
			MOV A, #80H
			MOVX @DPTR,A
			
			MOV R0,#16
			MOV DPTR,#9000H
			MOV A,#1
			
			LOOP:
			    MOVX @DPTR,A
                INC DPTR
                INC A				
				DJNZ R0,LOOP
		    
			START:
			MOV R0,#16
			MOV DPTR,#9000H
			
			
			LOOP1:
			    MOVX A,@DPTR
				MOV R1,DPL
				MOV DPTR,#0XE801
				MOVX @DPTR,A
				
				
				MOV DPTR,#0XE800
				MOV A,R1
				MOVX @DPTR,A
				
				MOV R2,#255
				LOOP01:
					MOV R3,#32
					LOOP02:
						MOV R4,#55
						LOOP03:
							DJNZ R4,LOOP03
						DJNZ R3,LOOP02
					DJNZ R2,LOOP01
				
				MOV DPTR,#9000H
				MOV DPL,R1
				INC DPTR
				
				DJNZ R0,LOOP1
				
				PT: SJMP PT 	
				
		END