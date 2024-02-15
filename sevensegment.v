`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2023 20:39:58
// Design Name: 
// Module Name: sevensegment
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


module sevensegment(
    input [3:0] number,
    output reg [6:0] out
    );
    
    always @* begin
    case(number)
    4'd0: out <= 7'b1111110;
    4'd1: out <= 7'b0110000;
    4'd2: out <= 7'b1101101;
    4'd3: out <= 7'b1111001;
    4'd4: out <= 7'b0110001;
    4'd5: out <= 7'b1011011;
    4'd6: out <= 7'b1011111;
    4'd7: out <= 7'b1110000;
    4'd8: out <= 7'b1111111;
    4'd9: out <= 7'b1111011;
    endcase
    end
endmodule
