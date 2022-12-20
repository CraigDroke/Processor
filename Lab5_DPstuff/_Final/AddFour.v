module AddFour (
    addrin, addrout
);

input [31:0] addrin;
output reg [31:0] addrout;

always begin
    addrout = addrin + 4;
end
    
endmodule