module DP_tb;

// Inputs
reg clk;

// Outputs
wire [31:0] ins;
wire regWEN, immSel, bSel, aSel, memRW, regSel, pcSel, brUn;
wire [3:0] aluOp;
wire [4:0] rd, rs1, rs2;
wire [31:0] din;
wire [31:0] regOutA, regOutB;
wire [31:0] addrout;
wire [31:0] aluout;
wire [31:0] aluA, aluB;
wire beq, blt;
wire [31:0] dMemOut;
wire [31:0] pcIn, pcOut;
wire [31:0] immsinextOut;

// Instantiate the Unit Under Test (UUT)
DP uut (
  .clk(clk),
  .ins(ins),
  .regWEN(regWEN),
  .immSel(immSel),
  .bSel(bSel),
  .aSel(aSel),
  .memRW(memRW),
  .regSel(regSel),
  .pcSel(pcSel),
  .brUn(brUn),
  .aluOp(aluOp),
  .rd(rd),
  .rs1(rs1),
  .rs2(rs2),
  .din(din),
  .regOutA(regOutA),
  .regOutB(regOutB),
  .addrout(addrout),
  .aluout(aluout),
  .aluA(aluA),
  .aluB(aluB),
  .beq(beq),
  .blt(blt),
  .dMemOut(dMemOut),
  .pcIn(pcIn),
  .pcOut(pcOut),
  .immsinextOut(immsinextOut)
);

// Testbench input stimulus
initial begin
  // Initialize inputs
  clk = 0;

  // Wait 100 ns for global reset to finish
  #100;

  // Add input stimulus here
end

// Clock generator
always #5 clk = ~clk;

endmodule
