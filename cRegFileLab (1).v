module cRegFileLab(clk, din, rd, rs1, rs2, rw, outA, outB, rst);

input [4:0]rd; //Write location
input [4:0] rs1, rs2; //register locations
input [31:0] din; //data in 
input rw ; //on/off
input rst; //reset all of the registers
input clk;
integer i; //random variable

output reg [31:0] outA , outB;

reg [31:0] mem [0:31];


always @(posedge clk) begin

if(rst==0) begin
	if (rw==1)
	mem[rd] <= din; //Write functionality

	else begin
	outA <= mem[rs1]; //Read functionality
	outB <= mem[rs2];
	end 
end 

else begin
	for(i=0; i<32; i=i+1) begin //Reset functionality
		mem[i] <= 0;
	end
	
end 
	
end
endmodule
			
		
		
	
	
	
 		