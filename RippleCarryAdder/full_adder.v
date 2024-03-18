`timescale 1ns / 1ps

module full_adder(A,B,Cin,Y,Cout);
    input wire A,B,Cin;
    output wire Y,Cout;
    assign Y = A ^ B ^ Cin;
    assign Cout = ((A^B) & Cin) | (A & B);
endmodule
