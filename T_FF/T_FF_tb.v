`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Yaðýz YAÐMUR
// Create Date: 25.07.2023 21:32:39
// Module Name: T_FF_tb
// Description: Testbench for T_FF module
// 
//////////////////////////////////////////////////////////////////////////////////


module T_FF_tb();

    //Initialize inputs as registers and outputs as wires
    reg clk, reset, set, T;
    wire Q, nQ;
    
    T_FF t(clk,reset,set,T,Q,nQ); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    initial begin
    clk<=0;
    T <= 0;
    reset <= 1;
    set <= 1;
    
    //SET and RESET test
    #10;
    set <= 0;
    #10;
    set <= 1;
    reset <= 0;
    #10;
    reset <= 1;
    #10;
    //Toggle Test
    T <= 1;
    #10;
    T <= 0;
    #10;
    T <= 1;
    end
endmodule
