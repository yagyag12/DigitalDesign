`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  
// Created by Yaðýz YAÐMUR
// Create Date: 15.07.2023 12:37:17
// Design Name: D Flip Flop
// Module Name: D_FF
// 
// Description: A simple D flip flop circuit 
// 
//////////////////////////////////////////////////////////////////////////////////

module D_FF(
    input clk, //Clock signal
    input D,  //Data input
    output reg Q, //Output State
    output nQ  //Not State Output
    );
    assign nQ = ~Q; //nQ is assigned to "not Q"
    
    always @(posedge clk) begin
    Q <= D; //Writes the D input data to output state on each clock cycle
    end
endmodule
