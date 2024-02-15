`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 20:46:23
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [3:0] A,
    input [3:0] B,
    input [2:0] S,
    input en,
    output reg [3:0] Z
    );
    
    always @* begin
    if(en)begin
        case(S)
            3'b000: Z = A + B;//toplama
            3'b001: Z = A - B;//cýkarma
            3'b010: Z = A + 1;//A+1
            3'b011: Z = A - 1;//A-1
            3'b100: Z = A & B;//A and B
            3'b101: Z = A | B;//A or B
            3'b110: Z = ~A;//not A
            3'b111: Z = A ^ B;//A xor B
            default:Z = A + B;//toplama
        endcase
    end
    else
        Z = 0;
        
    end
endmodule