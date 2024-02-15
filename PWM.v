`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 15:34:56
// Design Name: 
// Module Name: PWM
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


module PWM(
    input clk,rst,
    input [3:0] duty,
    output pwm
    );
    
    wire [3:0] count;
    
    pos4bitcounter counter(clk,rst,count);
    nbitcomparator comp(.A(duty),.B(count),.Ab(pwm));
    
endmodule