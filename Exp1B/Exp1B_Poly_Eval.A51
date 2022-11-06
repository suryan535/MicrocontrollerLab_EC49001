		
		
		ORG 8100H	
		
		MOV DPTR,#9500H
		MOV A,#4
		MOVX @DPTR,A ; value of n stored at 9500H

		MOV DPTR,#9501H
		MOV A,#2
		MOVX @DPTR,A ; value of x stored at 9501H

		MOV DPTR,#9500H
		MOVX A,@DPTR
		MOV R0,A
		INC R0

		MOV DPTR,#9502H
		MOV A,#10 ; value of a[0]

		LOOP:
			MOVX @DPTR,A ; keeps storing a[0],a[1],...,a[n]
			INC DPTR
			DEC A
			DJNZ R0,LOOP

		MOV DPTR,#9501H
		MOVX A,@DPTR
		MOV R0,A ; R0 stores the value of x

		MOV DPTR,#9500H
		MOVX A,@DPTR
		MOV R1,A ; R1 stores the value of n

		MOV DPTR,#9502H
		MOV A,DPL ; lower bits of starting address
		ADD A,R1 ; lower bits of address of a[n]
		MOV DPL,A ; DPTR points to address of a[n]
		MOVX A,@DPTR
		
		MOV R2,A ; R2 stores the value of evaluated polynomial

		EVALUATE:
			MOV A,R2
			MOV B,R0
			MUL AB ; multiply x with value evaluated till now
			MOV R2,A ; store the value back into R2
			DEC DPL
			MOVX A,@DPTR ; store previous coefficient in A
			ADD A,R2 ; add the coefficient to the result
			MOV R2,A
			DJNZ R1,EVALUATE
			
		MOV DPTR,#9550H
		MOV A,R2
		MOVX @DPTR,A

		STOP: SJMP STOP
		
		END