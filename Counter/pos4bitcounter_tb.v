`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 11:35:35
// Design Name: 
// Module Name: pos4bitcounter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pos4bitcounter_tb(

    );
    
    reg clk;
    reg reset;
    wire [3:0] count;
    
    pos4bitcounter c(clk,reset,count);
    
    always begin
        clk = ~clk;
        #5;
        end
        
    initial begin
        clk <= 0;
        reset <= 1;
        #10 reset <= 0;
        #180 $finish;
    
    end
endmodule
