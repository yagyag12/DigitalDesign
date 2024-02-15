`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Yaðýz YAÐMUR
// Create Date: 15.07.2023 13:11:58
// Module Name: JK_FF_tb
// Description: Testbench for JK_FF module
//
//////////////////////////////////////////////////////////////////////////////////

module JK_FF_tb();

    //Initialize inputs as registers and outputs as wires
    reg clk, J, K;
    wire Q,nQ;
    
    JK_FF jk(clk,J,K,Q,nQ); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    //Starts the tests
    initial begin
    clk <= 0;
    J <= 0;
    K <= 0;
    #10;
    J <= 0;
    K <= 1;
    #10;
    J <= 1;
    K <= 0;
    #10;
    J <= 1;
    K <= 1;
    #10;   
    end
endmodule
