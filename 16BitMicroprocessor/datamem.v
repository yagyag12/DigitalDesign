`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 12:35:10
// Design Name: 
// Module Name: datamem
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


module datamem(
    input clk, en, we,
    input [3:0] addr,
    input [7:0] din,
    output [7:0] dout
    );
    reg [7:0] data_memory[255:0];
    
    always @(posedge clk) begin
        if(en == 1 && we == 1)
            data_memory[addr] <= din;
    end
    assign dout = (en==1) ? data_memory[addr] : 0;
endmodule
