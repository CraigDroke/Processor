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
