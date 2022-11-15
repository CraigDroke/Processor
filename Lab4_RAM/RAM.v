module RAM (
    mem_addr, mem_data, mem_we, mem_clk, mem_out, mem_chip_select
);

// RAM with 8 chips, each chip has 256 words, each word is 32 bits

input [7:0] mem_addr;
input [31:0] mem_data;
input mem_we; // write enable (write = 1, read = 0)
input mem_clk;
output [31:0] mem_out;
input [2:0] mem_chip_select;

//case statement to select the chip
reg [255:0] chip0, chip1, chip2, chip3, chip4, chip5, chip6, chip7 [7:0];

//case statement for chip select
always @(mem_clk)
    begin
        if (mem_we == 0)
            begin
                case (mem_chip_select)
                    3'b000: mem_out <= {chip0[mem_addr+3], chip0[mem_addr+2], chip0[mem_addr+1], chip0[mem_addr]};
                    3'b001: mem_out <= {chip1[mem_addr+3], chip1[mem_addr+2], chip1[mem_addr+1], chip1[mem_addr]};
                    3'b010: mem_out <= {chip2[mem_addr+3], chip2[mem_addr+2], chip2[mem_addr+1], chip2[mem_addr]};
                    3'b011: mem_out <= {chip3[mem_addr+3], chip3[mem_addr+2], chip3[mem_addr+1], chip3[mem_addr]};
                    3'b100: mem_out <= {chip4[mem_addr+3], chip4[mem_addr+2], chip4[mem_addr+1], chip4[mem_addr]};
                    3'b101: mem_out <= {chip5[mem_addr+3], chip5[mem_addr+2], chip5[mem_addr+1], chip5[mem_addr]};
                    3'b110: mem_out <= {chip6[mem_addr+3], chip6[mem_addr+2], chip6[mem_addr+1], chip6[mem_addr]};
                    3'b111: mem_out <= {chip7[mem_addr+3], chip7[mem_addr+2], chip7[mem_addr+1], chip7[mem_addr]};
                endcase
            end
        else
            begin
                case (mem_chip_select)
                    3'b000: begin
                                chip0[mem_addr+3] <= mem_data[31:24];
                                chip0[mem_addr+2] <= mem_data[23:16];
                                chip0[mem_addr+1] <= mem_data[15:8];
                                chip0[mem_addr] <= mem_data[7:0];
                            end
                    3'b001: begin
                                chip1[mem_addr+3] <= mem_data[31:24];
                                chip1[mem_addr+2] <= mem_data[23:16];
                                chip1[mem_addr+1] <= mem_data[15:8];
                                chip1[mem_addr] <= mem_data[7:0];
                            end
                    3'b010: begin
                                chip2[mem_addr+3] <= mem_data[31:24];
                                chip2[mem_addr+2] <= mem_data[23:16];
                                chip2[mem_addr+1] <= mem_data[15:8];
                                chip2[mem_addr] <= mem_data[7:0];
                            end
                    3'b011: begin
                                chip3[mem_addr+3] <= mem_data[31:24];
                                chip3[mem_addr+2] <= mem_data[23:16];
                                chip3[mem_addr+1] <= mem_data[15:8];
                                chip3[mem_addr] <= mem_data[7:0];
                            end
                    3'b100: begin
                                chip4[mem_addr+3] <= mem_data[31:24];
                                chip4[mem_addr+2] <= mem_data[23:16];
                                chip4[mem_addr+1] <= mem_data[15:8];
                                chip4[mem_addr] <= mem_data[7:0];
                            end
                    3'b101: begin
                                chip5[mem_addr+3] <= mem_data[31:24];
                                chip5[mem_addr+2] <= mem_data[23:16];
                                chip5[mem_addr+1] <= mem_data[15:8];
                                chip5[mem_addr] <= mem_data[7:0];
                            end
                    3'b110: begin
                                chip6[mem_addr+3] <= mem_data[31:24];
                                chip6[mem_addr+2] <= mem_data[23:16];
                                chip6[mem_addr+1] <= mem_data[15:8];
                                chip6[mem_addr] <= mem_data[7:0];
                            end
                    3'b111: begin
                                chip7[mem_addr+3] <= mem_data[31:24];
                                chip7[mem_addr+2] <= mem_data[23:16];
                                chip7[mem_addr+1] <= mem_data[15:8];
                                chip7[mem_addr] <= mem_data[7:0];
                            end
                endcase
            end
    end
endmodule