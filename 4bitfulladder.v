`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created by Yagiz YAGMUR
// Create Date: 15.07.2023 18:51:15
// Module Name: fulladder
// Description: 4-bit Full Adder
// 
//////////////////////////////////////////////////////////////////////////////////

module fulladder(
    input [3:0] A, //First operand
    input [3:0] B, //Second operand
    input Ci, //Carry input
    output [3:0] Z, //Output Sum
    output Co //Carry output
    );
    assign {Co,Z} = A + B + Ci; //Summation operation
endmodule