module ALU_tb;

reg [3:0] op;
reg [31:0] a, b;
wire [31:0] out;
wire zero, overflow, carry, negative, odd_parity;

ALU uut (.op(op), .a(a), .b(b), .out(out), .negative(negative), .carry(carry), .overflow(overflow), .odd_parity(odd_parity), .zero(zero));

initial begin

//Add test
#10
a = 2;
b = 3;
op = 4'b0101;

//Subtract test
#10
a = 5;
b = 5;
op = 4'b0100;

//XOR test
#10
a = 2;
b = 2;
op = 4'b0001;

//AND test
#10
a = 8;
b = 8;
op = 4'b0010;

//OR test
#10
a = 2;
b = 3;
op = 4'b0011;

#10;

end
endmodule
