module DMem(
    input [31:0] addr,
    input [31:0] din,
    input clk,
    input memRW,
    output [31:0] dout,
);

reg [31:0] mem [0:31];
//reg [255:0] c1 [0:7];

always @(posedge clk) begin
    if (memRW == 1) begin
        mem[addr] <= din;
    end
    else begin
        dout <= mem[addr];
    end
end


endmodule