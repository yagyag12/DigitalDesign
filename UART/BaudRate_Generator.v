`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2023 14:23:14
// Design Name: 
// Module Name: BaudRate_Generator
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


module BaudRate_Generator(
    input [1:0] sel,
    input clk, rstn,
    output tick
    );
    
    reg [11:0] baud;
    reg [11:0] counter;
    
    always @ (sel)
    begin
        case(sel)
        2'b00: baud=15'd650; //9600
        2'b01: baud=15'd325; //19200
        2'b10: baud=15'd108; //57600
        2'b11: baud=15'd54;  //115200
        endcase
    end
    
    always @(posedge clk or negedge rstn)
        if(!rstn) counter <= 0;
        else if(tick) counter <= 0;
        else counter <= counter + 1;
             
   assign tick = (counter == baud);
endmodule
