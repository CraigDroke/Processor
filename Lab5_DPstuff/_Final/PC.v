module PC(addrin, addrout, clk, pcSel);

input [31:0] addrin; //32 bit address in
input clk;
input pcSel;
output reg [31:0] addrout; //32 bit address out


always@(posedge clk) begin
if(pcSel == 1) begin
	addrout <= addrin;
end

else begin
	addrout <= addrout + 4;
	end

end 
endmodule