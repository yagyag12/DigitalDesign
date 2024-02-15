`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2023 14:57:39
// Design Name: 
// Module Name: baudgenerator_tb
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


module baudgenerator_tb(

    );
    reg [1:0] sel;
    reg clk, rstn;
    wire tick;
    
    BaudRate_Generator uut(sel,clk,rstn,tick);
    
    always #5 clk <= ~clk;
    
    initial begin
    rstn<= 0;
    clk<= 0;
    sel <= 2'b01;
    #10;
    rstn<=1;
    
    end
    
endmodule
