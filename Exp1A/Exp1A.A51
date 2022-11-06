		
		
		ORG 8100H
		
		; Sorting the 100 Numbers
		MOV DPTR,#9000H
       
		MOV R0,#100
		MOV A,#252
		
		; populate the array to be sorted
		LOOP:
			MOVX @DPTR,A
			DEC A
			INC DPTR
			DJNZ R0,LOOP

		MOV R0,#100
		LOOP1:
			MOV R1,#99
			MOV DPTR,#9000H
			
			LOOP2:
				MOVX A,@DPTR
				MOV B,A ; B stores a[i]

				INC DPTR
				MOVX A,@DPTR ; A stores a[i+1]

				CJNE A,B,NOT_EQUAl
				NOT_EQUAL:
					JC DO_SWAP

				DJNZ R1,LOOP2
				DJNZ R0,LOOP1
				SJMP STOP

				DO_SWAP:
					XCH A,B

				MOVX @DPTR,A ; updated a[i+1] stored at appropriate address
				DEC DPL ; equivalent to decrementing DPTR since size of array < 256
				MOV A,B ; move updated a[i] to register B
				MOVX @DPTR,A ; updated a[i] stored at appropriate address

				INC DPTR
				
				DJNZ R1,LOOP2
			DJNZ R0,LOOP1

		STOP: SJMP STOP
			
		
		
		END