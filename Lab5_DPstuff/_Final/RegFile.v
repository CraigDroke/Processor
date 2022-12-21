module RegFile(
    input [4:0] rd, rs1, rs2,
    input [31:0] din,
    input rw,
    input clk,
    output reg [31:0] outA, outB
);
    reg [31:0] mem [0:31];

	integer i;
	
	initial
	begin
		for (i=0; i<32; i= i+1)
		begin
			mem[i]  <= 32'd0;
		end
	end

    always @(posedge clk) begin
        if (rw == 1) begin
            mem[rd] <= din;
        end
        else begin
            outA <= mem[rs1];
            outB <= mem[rs2];
        end
    end
endmodule
