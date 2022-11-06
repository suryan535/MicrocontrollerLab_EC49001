

		ORG 8100H
			
			MOV DPTR,#0XE803
			MOV A, #81H
			MOVX @DPTR,A
			
			MOV R0,#16
			MOV DPTR,#9000H
			MOV A,#1
			
			LOOP:
			    MOVX @DPTR,A
                INC DPTR
                INC A				
				DJNZ R0,LOOP
		    
			MOV R7,#0FH
			START:
				MOV R0,#16
				MOV DPTR,#9000H
				MOV R6,#0
				
				
				LOOP1:

					; Delay Loops
					MOV R2,#255
						LOOP01:
							MOV R3,#32
							LOOP02:
								MOV R4,#55
								LOOP03:
									DJNZ R4,LOOP03
								DJNZ R3,LOOP02
							DJNZ R2,LOOP01
							
					MOV DPTR,#0XE802
					MOVX A,@DPTR
					ANL A,#01H
					XRL A,#01H
					JZ BLINK
					JNZ NORMAL
					
					BLINK:
						MOV DPTR,#0XE800
						MOV A,R7
						MOVX @DPTR,A
						
						MOV DPTR,#0XE801
						MOVX @DPTR,A
						
						CPL A
						MOV R7,A
						
						SJMP START
					
					NORMAL:
						MOV DPTR,#9000H
						MOV DPL,R6
						MOVX A,@DPTR
						;MOV R1,DPL
						MOV DPTR,#0XE801
						MOVX @DPTR,A
						
						
						MOV DPTR,#0XE800
						MOV A,R6
						MOVX @DPTR,A
						
						INC R6
						
						DJNZ R0,LOOP1						
					
				SJMP START
			
				
		END