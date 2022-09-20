module cRegFileLab_t;

reg [4:0] rd, rs1, rs2;
reg [31:0] din;
reg rw, rst;
reg clk;

wire [31:0] outA, outB;

cRegFileLab uut (.clk(clk), .din(din), .rd(rd), .rs1(rs1), .rs2(rs2), .rw(rw), .outA(outA), .outB(outB), .rst(rst));

initial begin 
#10;
clk=0;
rst=0;

#10;
clk=1;
rst= 0;

rw=1;

rd = 5'b00010; //rd  = X2
din= 50;

#10;
clk= 0;

#10;
clk=1;
rd = 5'b00011; //rd = X3
din= 75;

#10;
clk=0;
rw=0;

#10
clk=1;
rs1= 5'b00010; //rs1 = X2
rs2= 5'b00011; //rs2 = X3

#10;
clk=0;

#10;
clk=1;
rst=1;

#10;
clk=0;

#10;
clk=1;
rst=0;

#10
clk=0;


end 
endmodule

