`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 12:45:00
// Design Name: 
// Module Name: programmem
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


module programmem(
    input clk,en,load,
    input [7:0] addr,
    input [7:0] load_addr,
    input [11:0] load_ins,
    output [11:0] ins
    );
    reg [11:0] program_memory [255:0];
    
    always @(posedge clk) begin
        if(load==1) program_memory[load_addr] <= load_ins;
    end
    
    assign ins = (en==1) ? program_memory[addr] : 0;
    
endmodule
