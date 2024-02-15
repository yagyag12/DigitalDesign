`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 15:57:09
// Design Name: 
// Module Name: PWM_tb
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


module PWM_tb(

    );
    
    reg clk, rst;
    reg [3:0] duty;
    wire pwm;
    
    PWM uut(clk,rst,duty,pwm);

    always #5 clk = ~clk;

    initial begin
    clk <= 1;
    rst <= 0;
    
    duty = 0.25 * 16;
    
    repeat (32) @ (posedge clk);
    duty = 0.5 * 16;
    
    repeat (32) @ (posedge clk);
 
    duty = 15;
    repeat (32) @ (posedge clk);
    end
    
endmodule
    
