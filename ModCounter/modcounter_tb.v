`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created by Yagiz YAGMUR
// Create Date: 16.07.2023 17:31:43
// Module Name: modcounter_tb
// Description: Testbench for modcounter module
// 
//////////////////////////////////////////////////////////////////////////////////

module modcounter_tb(

    );
    //Parameters used in the module
    parameter N = 8;
    parameter WIDTH = 4;
    
    //Initialize inputs as registers and outputs as wires
    reg clk,rstn;
    wire [WIDTH-1:0] out;
    
    modcounter uut(clk,rstn,out); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    //Starts the tests
    initial begin
    clk <= 0;
    rstn <= 0;
    #10;
    rstn <= 1;
    #10;
    repeat(20)@(posedge clk);
    end
endmodule
