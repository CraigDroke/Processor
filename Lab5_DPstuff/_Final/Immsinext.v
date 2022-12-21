module Immsinext(clk, in, imm_out, immSel);

input [31:0] in;
input clk;
input immSel;
output reg [31:0] imm_out;

//broken code

// always @(posedge clk) begin
// 	out = in + 20'b00000000000000000000;
// end

//working code prolly

always @(posedge clk) begin
	
	if (immSel == 1'b1) begin
	case (in[6:0])
		7'b0010011: imm_out <= { {21{in[31]}}, in[30:25], in[24:21], in[20]};   // ADDI     -> I-Type
        7'b0100011: imm_out <= { {21{in[31]}}, in[30:25], in[11:8], in[7]};     // SW       -> S-Type
        7'b0010111: imm_out <= { in[31], in[30:20], in[19:12], {12{1'b0}} };             // AUIPC    -> U-Type
        7'b0000011: imm_out <= { {21{in[31]}}, in[30:25], in[24:21], in[20]};   // LW       -> I-Type
        7'b1101111: imm_out <= { {12{in[31]}}, in[19:12], in[20], in[30:25], in[24:21], {1{1'b0}}};  // JAL -> J-Type
        7'b1100011: imm_out <= { {20{in[31]}}, in[7], in[30:25], in[11:8], {1{1'b0}}};  // BRANCH -> B-Type
        default: imm_out <= 32'b0;
	endcase
	end
	else begin
		imm_out <= 32'b0;
	end
end
endmodule
