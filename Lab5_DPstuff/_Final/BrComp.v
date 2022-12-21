module BrComp(opA, opB, beq, blt, brUn);
	input [31:0]opA, opB;
	input brUn;
	output reg beq, blt;
	
	always@(opA or opB or brUn)
	begin
		if (brUn == 1'b1)
		begin
			if (opA[31] == opB[31]) 
			begin 
				beq = (opA == opB); // beq = 1 neu A = B, beq = 0 neu A != B
				blt = (opA < opB); 
			end
			else // opA != opB
			begin
				beq = 1'b0; // beq = 1 neu A = B, beq = 0 neu A != B
				blt = (opA[31] == 1); // opA = 1xxx..xxxx, opB = 0xxx..xxxx 
			end
		end
		else 
		begin 
			beq = (opA == opB); 
			blt = (opA < opB);
		end
	end
endmodule
