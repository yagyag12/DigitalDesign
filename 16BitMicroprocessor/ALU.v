`timescale 1ns / 1ps

module ALU(
    input [7:0] op1,op2,
    input en,
    input [3:0] mode,
    input [3:0] cflags,
    output reg [7:0] out,
    output [3:0] flags //zero,carry,sign,overflow
    );
    
    wire Z,S,O;//zero,sign,overflow
    reg cout;
    
    always @* begin
        case(mode)
        4'b0000: {cout,out} = op1 + op2;
        4'b0001: begin out = op1 - op2; cout = !out[7]; end
        4'b0010: out = op1;
        4'b0011: out = op2;
        4'b0100: out = op1 & op2;
        4'b0101: out = op1 | op2;
        4'b0110: out = op1 ^ op2;
        4'b0111: begin out = op2 - op1; cout = out[7]; end
        4'b1000: {cout,out} = op2 + 8'h1;
        4'b1001: begin out = op2 - 8'h1; cout=!out[7]; end
        4'b1010: out = (op2 << op1[2:0]) | (op2 >> op1[2:0]);
        4'b1011: out = (op2 >> op1[2:0]) | (op2 << op1[2:0]);
        4'b1100: out = op2 << op1[2:0];
        4'b1101: out = op2 >> op1[2:0];
        4'b1110: out = op2 >>> op1[2:0];
        4'b1111: begin out = 8'h0 - op2; cout = !out[7]; end
        default: out = op1;
        endcase
    end
    assign O = out[7] ^ out[6];
    assign Z = (out == 0) ? 1 : 0;
    assign S = out[7];
    assign flags = {Z,cout,S,O};
endmodule
