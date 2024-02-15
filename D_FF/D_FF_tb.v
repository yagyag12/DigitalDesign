`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created by Yaðýz YAÐMUR
// Create Date: 15.07.2023 12:43:40
// Module Name: D_FF_tb
// Description: Testbench for D_FF module
// 
//////////////////////////////////////////////////////////////////////////////////

module D_FF_tb();
    
    //Initialize inputs as registers and outputs as wires
    reg clk;
    reg D;
    wire Q,nQ;
    
    D_FF d(clk,D,Q,nQ); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    //Starts the tests
    initial begin
        clk <= 0;
        D <= 0;
        #20;
        D <= 1;
        #20;
         D <= 0;
        #20;
         D <= 1;
        #20;
    end
endmodule
