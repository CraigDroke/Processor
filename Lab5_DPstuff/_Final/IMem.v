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
    
    always @(posedge clk) begin
        //hardcoded instructions

        // mem[0] <= 32'h01022083; //lw $s1, 16($s4)
        // mem[4] <= 32'h00110113; //addi $s16, $s16, 1
        // mem[8] <= 32'h01082023; //sw $s16, 0($s16)
        // mem[12] <= 32'h01ef4f33; //xor $s14, $s14, $s14

        //lw $s1, 16($s4)
        mem[0] <= 8'b10000011;
        mem[1] <= 8'b00100000;
        mem[2] <= 8'b00000010;
        mem[3] <= 8'b00000001;

        //addi $s16, $s16, 1
        mem[4] <= 8'b00010011;
        mem[5] <= 8'b00000001;
        mem[6] <= 8'b00010001;
        mem[7] <= 8'b00000000;

        //sw $s16, 0($s16)
        mem[8] <= 8'b00100011;
        mem[9] <= 8'b00100000;
        mem[10] <= 8'b00001000;
        mem[11] <= 8'b00000001;

        //xor $s14, $s14, $s14
        mem[12] <= 8'b00110011;
        mem[13] <= 8'b01001111;
        mem[14] <= 8'b11101111;
        mem[15] <= 8'b00000001;

        //loop generated instructions
        for (i = 16; i < 256; i = i + 4) begin
            mem[i] <= 8'b00010011;
            mem[i + 1] <= 8'b00000001;
            mem[i + 2] <= 8'b00010001;
            mem[i + 3] <= 8'b00000000;
        end


        //read instructions
        dout <= {mem[addr + 3], mem[addr + 2], mem[addr + 1], mem[addr]};
        rd_out <= dout[11:7];
        rs1_out <= dout[19:15];
        rs2_out <= dout[24:20];


    end
    
    
endmodule