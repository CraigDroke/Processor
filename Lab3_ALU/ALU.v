module ALU (
    op, a, b, out, zero, overflow, carry, negative, odd_parity
);

    input [3:0] op;
    input [31:0] a, b;
    output [31:0] out;
    output zero, overflow, carry, negative, odd_parity;

    wire [31:0] op_add, op_sub, op_and, op_or, op_xor;
    wire [32:0] add_carry, sub_carry;

    assign op_and = a & b;
    assign op_or = a | b;
    assign op_xor = a ^ b;
    assign add_carry = a + b;
    assign sub_carry = a - b;

    assign op_add = add_carry[31:0];
    assign op_sub = sub_carry[31:0];

    assign out = (op == 4'b0001) ? op_xor :
                 (op == 4'b0010) ? op_and :
                 (op == 4'b0011) ? op_or :
                 (op == 4'b0100) ? op_sub :
                 (op == 4'b0101) ? op_add :
                 32'b0;

    assign zero = (out == 32'b0);

    assign negative = out[31];

    // using the 2's complement representation
    assign overflow = (op == 4'b0100) ? (a[31] != b[31] && a[31] != out[31]) :
                      (op == 4'b0101) ? (a[31] == b[31] && a[31] != out[31]) :
                      1'b0;

    assign carry = (op == 4'b0100) ? sub_carry[32] :
                   (op == 4'b0101) ? add_carry[32] :
                   1'b0;

    assign odd_parity = (op != 4'b0) ? (out[0] ^ out[1] ^ out[2] ^ out[3] ^ out[4] ^ out[5] ^ out[6] ^ out[7] ^ out[8] ^ out[9] ^ out[10] ^ out[11] ^ out[12] ^ out[13] ^ out[14] ^ out[15] ^ out[16] ^ out[17] ^ out[18] ^ out[19] ^ out[20] ^ out[21] ^ out[22] ^ out[23] ^ out[24] ^ out[25] ^ out[26] ^ out[27] ^ out[28] ^ out[29] ^ out[30] ^ out[31]) :
                   1'b0;
    
endmodule