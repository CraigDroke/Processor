module IMem (
    input [31:0] addr,
    input clk,
    output reg[31:0] dout,
    output reg[4:0] rd_out,
    output reg[4:0] rs1_out,
    output reg[4:0] rs2_out
);
    
    reg [7:0] mem [0:255];
    integer i;
    
    initial begin
        $readmemh("instructions.dat",IMEM);
    end

    always @(posedge clk) begin
        //read instructions
        dout <= {mem[addr + 3], mem[addr + 2], mem[addr + 1], mem[addr]};
        rd_out <= dout[11:7];
        rs1_out <= dout[19:15];
        rs2_out <= dout[24:20];
    end
    
    
endmodule