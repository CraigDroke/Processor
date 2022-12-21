module Mux_2x1
(
    input [0:0] sel,
    input [31:0] in_0,
    input [31:0] in_1,
    output reg [31:0] out
);
    always @ (*) begin
        case (sel)
            1'b0: out = in_0;
            1'b1: out = in_1;
            default:
                out = 32'b0;
        endcase
    end
endmodule

module DP (
    clk
);

input clk;

//wires to connect all the modules to build a datapath for risc-v proccessor
//CU, RegFile, ALU, DMem, Immsinext, IMem, PC, BrComp, AddFour

wire [31:0] ins;
wire clk;

wire regWEN, immSel, bSel, aSel, memRW, regSel, pcSel, brUn;
wire [3:0] aluOp;

//RegFile
wire [4:0] rd, rs1, rs2;
wire [31:0] din;
wire [31:0] regOutA, regOutB;

//AddFour
wire [31:0] addrout;

//ALU
wire [31:0] aluout;
wire [31:0] aluA, aluB;

//BrComp
wire beq, blt;

//DMem
wire [31:0] dMemOut;

//PC
wire [31:0] pcIn, pcOut;

//IMemSinExt
wire [31:0] immsinextOut;


//Connect all the modules
CU CU1 (.in(ins), .beq(beq), .blt(blt), .regWEN(regWEN), .aluOp(aluOp), .immSel(immSel), .bSel(bSel), .aSel(aSel), .memRW(memRW), .regSel(regSel), .pcSel(pcSel), .brUn(brUn), .clk(clk));
IMem IMem1(.addr(pcOut), .clk(clk), .dout(ins), .rd_out(rd), .rs1_out(rs1), .rs2_out(rs2));
RegFile RegFile1(.rd(rd), .rs1(rs1), .rs2(rs2), .din(din), .rw(regWEN), .clk(clk), .outA(regOutA), .outB(regOutB));
BrComp BrComp1(.opA(regOutA), .opB(regOutB), .brUn(brUn) ,.beq(beq), .blt(blt));
ALU ALU1(.op(aluOp), .a(aluA), .b(aluB), .out(aluout));
DMem DMem1(.addr(aluout), .din(regOutB), .dout(dMemOut), .memRW(memRW), .clk(clk));
AddFour AddFour1(.addrin(pcOut), .addrout(addrout), .clk(clk));
IMemSinExt IMemSinExt1(.in(ins), .imm_out(immsinextOut), .immSel(immSel), .clk(clk));
PC PC1(.addrin(pcIn), .addrout(pcOut), .clk(clk));
Mux_2x1 PCSelMux1(.sel(pcSel), .in_0(addrout), .in_1(aluout), .out(pcIn));
Mux_2x1 ASelMux1(.sel(aSel), .in_0(regOutA), .in_1(pcOut), .out(aluA));
Mux_2x1 BSelMux1(.sel(bSel), .in_0(regOutB), .in_1(immsinextOut), .out(aluB));
Mux_2x1 RegSelMux1(.sel(regSel), .in_0(dMemOut), .in_1(aluout), .out(din));


endmodule