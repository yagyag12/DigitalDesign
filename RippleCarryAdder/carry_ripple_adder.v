`timescale 1ns / 1ps

module carry_ripple_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y,
    output Cout);
    wire [2:0] C;
    full_adder sum0(.A(A[0]), .B(B[0]), .Y(Y[0]), .Cout(C[0]), .Cin(1'b0));
    full_adder sum1(.A(A[1]), .B(B[1]), .Y(Y[1]), .Cout(C[1]), .Cin(C[0]));
    full_adder sum2(.A(A[2]), .B(B[2]), .Y(Y[2]), .Cout(C[2]), .Cin(C[1]));
    full_adder sum3(.A(A[3]), .B(B[3]), .Y(Y[3]), .Cout(Cout), .Cin(C[2]));
endmodule
