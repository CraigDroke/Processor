module Immsinext(clk, in, out);

input [11:0] in;
input clk;
output reg [31:0] out;

//broken code

always @(posedge clk) begin
	out = in + 20'b00000000000000000000;
end
endmodule
