`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Created by Yagiz YAGMUR
// Create Date: 15.07.2023 19:04:35 
// Module Name: fulladder_tb
// Description: Testbench for fulladder module
//
//////////////////////////////////////////////////////////////////////////////////


module fulladder_tb();

    //Initialize inputs as registers and outputs as wires
    reg [3:0] A;
    reg [3:0] B;
    reg Ci;
    wire [3:0] Z;
    wire Co;
    
    fulladder uut(A,B,Ci,Z,Co); //Adds the module into the testbench
    
    //Starts the tests
    initial begin
    A <= 4'b0010;
    B <= 4'b0001;
    Ci <= 1;
    #20;
    
    A <= 4'b0011;
    B <= 4'b0011;
    Ci <= 0;
    #20;   

    A <= 4'b1111;
    B <= 4'b1111;
    Ci <= 1;
    #20;    
    end
endmodule
