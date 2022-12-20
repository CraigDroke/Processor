module cRAM(cSel, din, memA, clk, wEN, out);

//Inputs
input [31:0] din;
input [7:0] memA;
input [2:0] cSel;
input clk, wEN; //(Read = 0, Write = 1)

//Output
output reg [31:0] out;

//RAM chips (8 of them), 64(words)x4 = 256 bytes

reg [255:0] c1 [0:7];
reg [255:0] c2 [0:7];
reg [255:0] c3 [0:7];
reg [255:0] c4 [0:7];
reg [255:0] c5 [0:7];
reg [255:0] c6 [0:7];
reg [255:0] c7 [0:7];
reg [255:0] c8 [0:7];

//Function
always @(posedge clk) begin 


//Read
	if(wEN == 0) begin
		case(cSel)
		3'b000 : out <= {c1[memA + 3], c1[memA + 2], c1[memA + 1], c1[memA]};
		3'b001 : out <= {c2[memA + 3], c2[memA + 2], c2[memA + 1], c2[memA]};
		3'b010 : out <= {c3[memA + 3], c3[memA + 2], c3[memA + 1], c3[memA]};
		3'b011 : out <= {c4[memA + 3], c4[memA + 2], c4[memA + 1], c4[memA]};
		3'b100 : out <= {c5[memA + 3], c5[memA + 2], c5[memA + 1], c5[memA]};
		3'b101 : out <= {c6[memA + 3], c6[memA + 2], c6[memA + 1], c6[memA]};
		3'b110 : out <= {c7[memA + 3], c7[memA + 2], c7[memA + 1], c7[memA]};
		3'b111 : out <= {c8[memA + 3], c8[memA + 2], c8[memA + 1], c8[memA]};
		default: out <= 0;
		endcase
	end 

	
//Write
	else begin
		case(cSel)
		3'b000 : begin
			c1[memA + 3] <= din[31:24];
			c1[memA + 2] <= din[23:16];
			c1[memA + 1] <= din[15:8];
			c1[memA] <= din[7:0];
			end
		3'b001 : begin
			c2[memA + 3] <= din[31:24];
			c2[memA + 2] <= din[23:16];
			c2[memA + 1] <= din[15:8];
			c2[memA] <= din[7:0];
			end
		3'b010 : begin
			c3[memA + 3] <= din[31:24];
			c3[memA + 2] <= din[23:16];
			c3[memA + 1] <= din[15:8];
			c3[memA] <= din[7:0];
			end
		3'b011 : begin
			c4[memA + 3] <= din[31:24];
			c4[memA + 2] <= din[23:16];
			c4[memA + 1] <= din[15:8];
			c4[memA] <= din[7:0];
			end
		3'b100 : begin
			c5[memA + 3] <= din[31:24];
			c5[memA + 2] <= din[23:16];
			c5[memA + 1] <= din[15:8];
			c5[memA] <= din[7:0];
			end
		3'b101 : begin
			c6[memA + 3] <= din[31:24];
			c6[memA + 2] <= din[23:16];
			c6[memA + 1] <= din[15:8];
			c6[memA] <= din[7:0];
			end
		3'b110 : begin
			c7[memA + 3] <= din[31:24];
			c7[memA + 2] <= din[23:16];
			c7[memA + 1] <= din[15:8];
			c7[memA] <= din[7:0];
			end
		3'b111 : begin
			c8[memA + 3] <= din[31:24];
			c8[memA + 2] <= din[23:16];
			c8[memA + 1] <= din[15:8];
			c8[memA] <= din[7:0];
			end
		default: c1[memA] <= 8'b00000000;
		endcase
	end

end
endmodule
