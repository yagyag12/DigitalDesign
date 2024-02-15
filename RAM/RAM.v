`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 10:02:54
// Design Name: 
// Module Name: RAM
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


module RAM(
    input clk,//Clock signal
    input we, //Write Enable
    input [3:0] data_in, //Data input
    input [2:0] address, //Address
    output [3:0] data_out //Data Output
    );
    
    reg [3:0] ram [0:7]; //SRAM
    
    always @(posedge clk)begin
        if(we) ram[address] <= data_in;
    end
    
    assign data_out = ram[address];
    
endmodule
