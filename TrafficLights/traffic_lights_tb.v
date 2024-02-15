`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2023 00:13:28
// Design Name: 
// Module Name: traffic_lights_tb
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


module traffic_lights_tb(

    );
    reg clk, rstn;
    wire red, green, yellow;
    
    traffic_lights #(.GREENTIMER(6),.YELLOWTIMER(2),.REDTIMER(8)) uut(clk,rstn,red,green,yellow);
    
    always #5 clk <= ~clk;
    
    initial begin
    clk<= 0;
    rstn <= 1;
    #10;
    rstn <= 0;
    #10;
    rstn <= 1;
    
    end
endmodule
