INIT_loop:			MOV		ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
Find_LSB_Q:         LSL7	ACC             # Logical shift left 7 times. If 01010101 (LSL7) = 10000000. The least significant bit becomes the most significant one
					MSB		ACC				# MSB. If 10000000, MSB = 00000001.
					MOV		A, ACC 			# Load the less significant bit of Q in A
-LSB_Q:				INV 	ACC				# Ones comp of ACC (ACC = LSB (Q))
					MOV		A, ACC 			# Load not (ACC) in A register
					MOV 	ACC, CTE		# load address of 1 in ACC
					0x01					# CTE + 1
					ADD		ACC, A			# ACC = -(LSB (Q)), In twos comp
					MOV		A, ACC 			# Load -(LSB (Q)) in A register
Load_Q-1: 			MOV 	ACC,CTE			# Load address of Q-1 in ACC (8 bit register. Only the least significant bit is used)
					Q-1						# CTE - address of Q-1
					MOV		DPTR, ACC 		# move address of Q-1 to DPTR
					MOV 	ACC, [DPTR]		# Load Q-1 in ACC.
					ADD 	ACC, A			# ACC = -(LSB (Q)) + (Q-1)
Equal_Values:		JZ						# IF -(LSB (Q)) + (Q-1) = 0. LSB(Q) == 1 && Q-1 = 1 || LSB(Q) == 0 && Q-1 = 0
					L_S_R					# IF LSB (Q) = Q-1, JUMP TO L_S_R (Logic shift right). If They are equal, just Arithmetic shift right is done.
Different_Values:	MOV 	ACC, CTE		# Load CTE -1
					0xFF					# Load -1
					MOV		A, ACC 			# Load -1 in A register
Load_Q:				MOV		ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
Find_LSB_Q:         LSL7	ACC             # Logical shift left 7 times. If 01010101 (LSL7) = 10000000. The least significant bit becomes the most significant one
					MSB		ACC				# MSB. If 10000000, MSB = 00000001.
Check_LSB_Q:		ADD 	ACC, A			# LSB(Q) + (-1)
					JZ						# IF LSB(Q) + (-1) = 0, Thus, LSB(Q)=1. Since we know that LSB(Q) != Q-1, there's no need to check again.
					Resta					# If LSB(Q)= 1, RESTA. If LSB(Q)= 0, SUMA. 1 0 = resta, 0 1 = suma. Como 1-1 es =0, sabemos que Q0 es 1.
Suma:				MOV 	ACC, CTE		# Load address of A_var in ACC
					A_var					# CTE - address of A_var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.	
					MOV		A, ACC			# Load A_var in the register A
					MOV 	ACC, CTE		# Load address of M in ACC
					M 						# CTE - address of M
					MOV		DPTR, ACC 		# move address of M to DPTR
					MOV 	ACC, [DPTR]		# Load M in ACC.
					ADD     ACC, A			# ACC = a_VAR + M
					MOV		A, ACC 			# Load a_VAR + M in A register
Jump_updt_A:		JMP 	CTE				# Jump to L_S_R
					Updt_A_var				# Jump to Updt_A_var when add instruction is done, so A_var is updated
Resta:	            MOV		ACC, CTE		# Load address of M in ACC
					M						# CTE - address of M
					MOV		DPTR, ACC 		# move address of M to DPTR
					MOV 	ACC, [DPTR]		# Load M in ACC.		
-M:					INV 	ACC				# Ones comp of ACC (ACC = M)
					MOV		A, ACC 			# Load not (M) in A register
					MOV 	ACC, CTE		# load address of 1 in ACC
					0x01					# CTE + 1
					ADD		ACC, A			# ACC = -(M), In twos comp
					MOV		A, ACC 			# Load -(M) in A register		
					MOV     ACC, CTE		# Load address of A_var in ACC
					A_var					# CTE - address of A_var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.		
					ADD	    ACC, A			# ACC = A_var + (-M)
					MOV     A, ACC			# Load ACC in A register		There's no need to jump, since Updt_A_var is the next instruction
Updt_A_var: 		MOV 	ACC, CTE		# Load address of A_var in ACC
					A_var 					# CTE - address of A_var					
					MOV		DPTR, ACC		# Move address of A_var to DPTR
					MOV 	ACC, A			# move A to ACC register (ACC = a_VAR - M || a_VAR + M)
					MOV		[DPTR], ACC		# Store new value A_var.       There's no need to jump, since L_S_R is the next instruction					
L_S_R:				MOV		ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
Find_LSB_Q:         LSL7	ACC             # Logical shift left 7 times. If 01010101 (LSL7) = 10000000. The least significant bit becomes the most significant one
					MSB		ACC				# MSB. If 10000000, MSB = 00000001.
					MOV		A, ACC 			# Load the less significant bit of Q in A
Updt_Q-1: 			MOV 	ACC, CTE		# Load address of Q-1 in ACC
					Q-1						# CTE - address of Q-1
					MOV     DPTR, ACC		# Move address of Q-1 to DPTR
					MOV 	ACC, A			# move A to ACC register (ACC = LSB Q)
					MOV		[DPTR], ACC		# Store ACC in Q-1
LSR_Q:				MOV		ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.
					LSR 	ACC				# Logic shift right to ACC = Q.
					MOV		A, ACC 			# Load the LSR of Q, into A.
Updt_Q: 			MOV 	ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV     DPTR, ACC		# Move address of Q to DPTR
					MOV 	ACC, A			# move A to ACC register (ACC = LSR Q)
					MOV		[DPTR], ACC		# Store ACC in Q. The LSR of Q, is stored, so Q is updated.										
Load_-1:			MOV 	ACC, CTE		# Load CTE -1
					0xFF					# Load -1
					MOV		A, ACC 			# Load -1 in A register
Load_LSB_A:			MOV 	ACC, CTE 		# Load address of A_var in ACC
					A_var					# CTE - address of A var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.
					LSL7	ACC             # Logical shift left 7 times. If 01010101 (LSL7) = 10000000. The least significant bit becomes the most significant one
					MSB		ACC				# MSB. If 10000000, MSB = 00000001.					
					ADD		ACC, A			# LSB(A)+(-1)
					JZ     	            	# IF (LSB (A) = 0), then LSB(A) = 1, because 1 + (-1) = 0
					1_OR_Q					# LSB(A) = 1, JUMP to 1_OR_Q. Put mask. Q OR 10000000, to change the Most Significant bit of Q, to 1			
0_AND_Q:			MOV		ACC, CTE		# No need to jump. Load address of Q in ACC. IF (LSB (A) is negative), then LSB(A) = 0. Esto, porque 0-1 es negativo
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
					MOV		A, ACC			# Load Q in A register
					MOV		ACC, CTE		# Load address of Q in ACC
					Mask_AND				# CTE - address of Mask_AND
					MOV		DPTR, ACC 		# move address of Mask_AND to DPTR
					MOV 	ACC, [DPTR]		# Load Mask_AND in ACC.	
					AND     ACC, A			# Q AND Mask_AND. Q AND 01111111. The Most significant bit of Q, is replaced with a 0, doesn't matter if it is 1 or 0
					MOV     A, ACC			# Load ACC in A register
					JMP		CTE				# Go Updt_Q_AND_OR. Done to save lines
					Updt_Q_AND_OR
1_OR_Q:				MOV		ACC, CTE		# Load address of Q in ACC
					Q						# CTE - address of Q
					MOV		DPTR, ACC 		# move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
					MOV		A, ACC			# Load Q in A register
					MOV		ACC, CTE		# Load address of Q in ACC
					Mask_OR					# CTE - address of Mask_OR
					MOV		DPTR, ACC 		# move address of Mask_OR to DPTR
					MOV 	ACC, [DPTR]		# Load Mask_OR in ACC. 		
					OR	    ACC, A			# Q OR Mask_OR. Q OR 10000000. The Most significant bit of Q, is replaced with a 1, doesn't matter if it is 1 or 0
					MOV     A, ACC			# Load ACC in A register
Updt_Q_AND_OR: 		MOV 	ACC, CTE		# Load address of Q in ACC
					Q 						# CTE - address of Q					
					MOV		DPTR, ACC		# Move address of Q to DPTR
					MOV 	ACC, A			# move A to ACC register
					MOV		[DPTR], ACC		# Store new value Q.		NO JUMP IS NEEDED SINCE LSR_A IS NEXT			
Load_-1:			MOV 	ACC, CTE		# Load CTE -1
					0xFF					# Load -1
					MOV		A, ACC 			# Load -1 in A register
Load_MSB_A:			MOV 	ACC, CTE 		# Load address of A_var in ACC
					A_var					# CTE - address of A var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.
					MSB 	ACC				# MOST significant bit of A_var. If MSB(A)=0, 00000000, if MSB(A)=1, 00000001
					ADD		ACC, A			# MSB(A)+(-1).
Comparacion_MSB:	JN						# IF (MSB (A) is negative), then MSB(A) = 0
					0_AND_A					# JUMP to 0_AND_A. Put mask. A_var AND 01111111, to change the Most Significant bit of A_var, to 0 (REPLICATE)
					JZ     	            	# IF (MSB (A) = 0), then MSB(A) = 1, because 1 + (-1) = 0
					1_OR_A					# JUMP to 1_OR_A. Put mask. A_var OR 10000000, to change the Most Significant bit of A_var, to 1 (REPLICATE)		
0_AND_A:			MOV		ACC, CTE		# Load address of A_var in ACC
					A_var					# CTE - address of A_var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.
					LSR 	ACC				# Logic shift right to ACC = A_var.
					MOV		A, ACC			# Load A_var in A register
					MOV		ACC, CTE		# Load address of A_var in ACC
					Mask_AND				# CTE - address of Mask_AND
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load Mask_AND in ACC.	
					AND     ACC, A			# A_var AND Mask_AND. A_var AND 01111111. The Most significant bit of A_var, is replaced with a 0, doesn't matter if it is 1 or 0
					MOV     A, ACC			# Load ACC in A register
					JMP		CTE				# Go Updt_Q_AND_OR. Done to save lines
					Updt_A_AND_OR
1_OR_A:				MOV		ACC, CTE		# Load address of A_var in ACC
					A_var					# CTE - address of A_var
					MOV		DPTR, ACC 		# move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.
					LSR 	ACC				# Logic shift right to ACC = A_var.
					MOV		A, ACC			# Load A_var in A register
					MOV		ACC, CTE		# Load address of A_var in ACC
					Mask_OR					# CTE - address of Mask_OR
					MOV		DPTR, ACC 		# move address of Mask_OR to DPTR
					MOV 	ACC, [DPTR]		# Load Mask_OR in ACC. 		
					OR	    ACC, A			# A_var OR Mask_OR. A_var OR 10000000.	 The Most significant bit of A_var, is replaced with a 1, doesn't matter if it is 1 or 0
					MOV     A, ACC			# Load ACC in A register.		NO JUMP IS NEEDED SINCE Updt_A_AND_OR IS NEXT
Updt_A_AND_OR: 		MOV 	ACC, CTE		# Load address of A_var in ACC
					A_var 					# CTE - address of A_var					
					MOV		DPTR, ACC		# Move address of A_var to DPTR
					MOV 	ACC, A			# move A to ACC register
					MOV		[DPTR], ACC		# Store new value A_var.		
Test_loop:			MOV 	ACC, CTE		# Load CTE -1
					0xFF					# Load -1
					MOV		A, ACC 			# Load -1 in A register
					MOV		ACC, CTE        # Load address of count in ACC
					count					# CTE - address of count 
					MOV		DPTR, ACC 		# move address of count to DPTR
					MOV 	ACC, [DPTR]		# Load count in ACC.			
					ADD     ACC, A			# ACC = count + (-1). This is count--;
					MOV		A, ACC 			# Load count + (-1) in A register	
Updt_count: 		MOV 	ACC, CTE		# Load address of count in ACC
					count 					# CTE - address of count					
					MOV		DPTR, ACC		# Move address of count to DPTR
					MOV 	ACC, A			# move A to ACC register 
					MOV		[DPTR], ACC		# Store new value count.
					MOV 	ACC, A			# move A to ACC register (Generates FLAG).	
					JZ						# Test if ACC = count == 0
GoTo_END_LOOP:		END_loop				# Go to END_LOOP if count == 0
					JMP 	CTE				# If count != 0, Loop repeats
					INIT_loop
END_loop:			MOV 	ACC, CTE		# Load address of A_var in ACC # After the program ended, the results of the multiplication are stored in A_var and A, and Q and ACC.
					A_var 					# CTE - address of A_var					
					MOV		DPTR, ACC		# Move address of A_var to DPTR
					MOV 	ACC, [DPTR]		# Load A_var in ACC.	
					MOV 	A, ACC			# move ACC to A register
					MOV 	ACC, CTE		# Load address of Q in ACC
					Q 						# CTE - address of Q					
					MOV		DPTR, ACC		# Move address of Q to DPTR
					MOV 	ACC, [DPTR]		# Load Q in ACC.	
END_Program:		HALT					# End program. HALT
Q:			0xFD							# Q =  11111101 Multiplier (-3)
M:			0x07							# M = 00000111 Multiplicand (7)
Q-1:		0x00							# Q-1 = 0 (We use the LSB of Q-1)
A_var:		0x00							# A_var = 00000000 Called A_var, to avoid confusion with A Variable.
count:		0x08							# count = n = 8 = M & Q Bit quantity = 00001000
Mask_AND:   0x7F							# 01111111 = (127)
Mask_OR:   	0x80							# 10000000 = (128)