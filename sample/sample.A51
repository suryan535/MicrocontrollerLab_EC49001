//This simple program describes the addition of two hexadecimal numbers
//and save the result in an external memory area. 

		
		
		
		
		ORG 8100H		  // The starting address of the program code in memory

		MOV DPTR,#81FFH	  // Initialize DPTR to store the result of addition
		MOV A,#33H		  // Register A will be loaded by the hexadecimal number 33H
		MOV R0,#22H		  // Register R0 will be loaded by the hexadecimal number 22H 
		ADD A,R0		  // Add A and the number stored in R0; put the sum in A
		MOVX @DPTR,A	  // The sum will be saved to external memory area 81FFH
		END
		