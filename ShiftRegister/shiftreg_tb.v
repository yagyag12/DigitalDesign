`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created by Yagiz YAGMUR
// Create Date: 16.07.2023 11:33:30
// Module Name: shiftreg_tb
// Description: Testbench for shiftreg module
// 
//////////////////////////////////////////////////////////////////////////////////

module shiftreg_tb();
    //Initialize inputs as registers and outputs as wires
    reg clk,data,en,dir,rstn;
    wire [3:0] out;
    
    shiftreg uut(clk,data,en,dir,rstn,out); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    initial begin
        clk <= 0;
        data <= 0;
        en <= 0;
        dir <= 0;
        rstn <= 1;
        #20;
        en <= 1;
        repeat(7) @(posedge clk)
            data <= ~data;
            
        #20;
        dir <= 1;
        repeat(7) @(posedge clk)
            data <= ~data;        
        
        repeat(7) @(posedge clk);
        
        $finish;
    end
endmodule
