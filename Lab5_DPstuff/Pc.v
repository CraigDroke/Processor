module Pc(addrin, addrout, clk);

input [31:0] addrin; //32 bit address in
input clk;
output reg [31:0] addrout; //32 bit address out


always@(posedge clk) begin
	addrout <= addrin + 4;
end 
endmodule
