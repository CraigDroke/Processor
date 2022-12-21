`timescale 1ns / 1ps

module DP_tb;

// Inputs
reg [31:0] ins;
reg clk;

reg regWEN, immSel, bSel, aSel, memRW, regSel, pcSel, brUn;
reg [3:0] aluOp;
reg [4:0] rd, rs1, rs2;
reg [31:0] din;

// Outputs
wire [31:0] regOutA, regOutB;
wire beq, blt;
wire [31:0] aluout;
wire [31:0] dMemOut;
wire [31:0] pcOut;
wire [31:0] immsinextOut;

// Instantiate DP module
DP dp(
  .ins(ins),
  .clk(clk),
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
  .beq(beq),
  .blt(blt),
  .aluout(aluout),
  .dMemOut(dMemOut),
  .pcOut(pcOut),
  .immsinextOut(immsinextOut)
);

// Initialize input values
initial begin
  ins = 32'h00000000;
  clk = 0;
  regWEN = 0;
  immSel = 0;
  bSel = 0;
  aSel = 0;
  memRW = 0;
  regSel = 0;
  pcSel = 0;
  brUn = 0;
  aluOp = 4'h0;
  rd = 5'h0;
  rs1 = 5'h0;
  rs2 = 5'h0;
  din = 32'h00000000;
end

// Toggle clock
always begin
  #5 clk = ~clk;
end
  
  // Test case 1
  initial begin
    // Set input values
    ins = 32'h00000000;
    regWEN = 1;
    immSel = 0;
    bSel = 0;
    aSel = 0;
    memRW = 0;
    regSel = 0;
    pcSel = 0;
    brUn = 0;
    aluOp = 4'h0;
    rd = 5'h1;
    rs1 = 5'h2;
    rs2 = 5'h3;
    din = 32'h00000000;

    // Wait for 5 clock cycles
    #25;

    // Check output values
    assert(regOutA == 32'h00000000);
    assert(regOutB == 32'h00000000);
    assert(beq == 1'b0);
    assert(blt == 1'b0);
    assert(aluout == 32'h00000000);
    assert(dMemOut == 32'h00000000);
    assert(pcOut == 32'h00000000);
    assert(immsinextOut == 32'h00000000);
  end

  // Test case 2
  initial begin
    // Set input values
    ins = 32'h00000000;
    regWEN = 1;
    immSel = 1;
    bSel = 1;
    aSel = 1;
    memRW = 1;
    regSel = 1;
    pcSel = 1;
    brUn = 1;
    aluOp = 4'hF;
    rd = 5'hF;
    rs1 = 5'hF;
    rs2 = 5'hF;
    din = 32'hFFFFFFFF;

    // Wait for 5 clock cycles
    #25;

    // Check output values
    assert(regOutA == 32'hFFFFFFFF);
    assert(regOutB == 32'hFFFFFFFF);
    assert(beq == 1'b1);
    assert(blt == 1'b1);
    assert(aluout == 32'hFFFFFFFF);
    assert(dMemOut == 32'hFFFFFFFF);
    assert(pcOut == 32'hFFFFFFFF);
    assert(immsinextOut == 32'hFFFFFFFF);
  end

  // Add additional test cases here...

endmodule
