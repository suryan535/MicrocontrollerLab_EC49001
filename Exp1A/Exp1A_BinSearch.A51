		
		
		
		ORG 8132H
		
		MOV DPTR,#9500H
		MOV A,#254
		MOVX @DPTR,A

		MOV DPTR,#9550H
		MOV A,#0XFF ; store -1 by default
		MOVX @DPTR,A

		MOV R0,#0 ; left bound of subarray
		MOV R1,#99 ; right bound of subarray

		LOOP:
			MOV A,R0
			MOV B,R1
			ADD A,B ; A = R0+R1
			MOV B,#2
			DIV AB ; A = (R0+R1)/2
			MOV R2,A ; store the index of the midpoint element in R2

			MOV DPTR,#9000H
			MOV DPL,A
			MOVX A,@DPTR ; get the value stored in array at midpoint
			MOV B,A

			MOV DPTR,#9500H
			MOVX A,@DPTR ; get the value to be searched for

			CJNE A,B,COMPARE_VALUES ; if A!=B, compare values and reject appropriate half
			MOV DPTR,#9550H ; else store current midpoint index at required address
			MOV A,R2
			MOVX @DPTR,A
			SJMP STOP

			COMPARE_VALUES:
				JC REJECT_UPPER ; if search value<midpoint value, reject upper half
				SJMP REJECT_LOWER ; else reject lower half

				REJECT_UPPER:
					MOV A,R2
					DEC A
					MOV R1,A
					SJMP UPDATE_BOUNDS

				REJECT_LOWER:
					MOV A,R2
					INC A
					MOV R0,A

			UPDATE_BOUNDS:
				MOV A,R0
				MOV B,R1
				CJNE A,B,COMPARE_BOUNDS ; if R0!=R1, compare who is greater
				SETB CY ; else set carry = 1 so that it still loops as we want to loop for R0<=R1

				COMPARE_BOUNDS:
					JC LOOP ; if R0<R1, continue to search
					SJMP STOP ; else come out of loop

				MOV A,R0
				ADD A,R1

		STOP: SJMP STOP
		
		END
