`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 11:28:54
// Design Name: 
// Module Name: pos4bitcounter
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


module pos4bitcounter(
    input clk,
    input reset,
    output [3:0] out
    );

    reg[3:0] count = 0;
    assign out = count;

    always @(posedge clk) begin
    
    if(!reset) count <= count + 1; 
    else count <= 0;
    end
endmodule
