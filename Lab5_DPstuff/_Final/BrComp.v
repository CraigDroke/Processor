module BrComp(opA, opB, brUn, blt, beq);

input [31:0] opA, opB; //32 bit inputs
input brUn; //unsigned control signal
output reg blt, beq;
reg [31:0] A=opA, B=opB;

always@(*) begin

if (brUn) begin

	if (opA[31]) begin
		
		A <= A + 1;
		A = ~A;
	
	end
	
	if (opB[31]) begin
		
		B <= B - 1;
		B = ~B;
	
	end
	
end
	
if (A < B) begin
	
	blt = 1;
	
end 
else begin
		
	blt = 0;
		
end
	
if (A == B) begin
	
	beq = 1;
		
end 
else begin
	
	beq = 0;
		
end

end
endmodule