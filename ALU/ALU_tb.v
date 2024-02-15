`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 21:32:44
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(

    );
    
    reg [3:0] A,B;
    reg [2:0] S;
    reg en;
    wire [3:0] Z;
    
    ALU uut(A,B,S,en,Z);
    
    initial begin
    en <= 0;
    A <= 4'b1001;
    B <= 4'b0101;
    
    S <= 3'b000; #10;
    S <= 3'b001; #10;
    S <= 3'b010; #10;
    S <= 3'b011; #10;
    S <= 3'b100; #10;
    S <= 3'b101; #10;
    S <= 3'b110; #10;
    S <= 3'b111; #10;

    en <= 1; 
    S <= 3'b000; #10;
    S <= 3'b001; #10;
    S <= 3'b010; #10;
    S <= 3'b011; #10;
    S <= 3'b100; #10;
    S <= 3'b101; #10;
    S <= 3'b110; #10;
    S <= 3'b111; #10;    
    
    
    
    end
    
endmodule
