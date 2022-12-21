module AddFour (
    addrin, addrout, clk
);

input [31:0] addrin;
input clk;
output reg [31:0] addrout;

always @(posedge clk) begin
    addrout <= addrin + 4;
end
    
endmodule