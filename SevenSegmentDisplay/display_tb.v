`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 13:04:07
// Design Name: 
// Module Name: display_tb
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


module display_tb();

    reg [3:0] Atb;
    wire [6:0] Ytb;
    wire [7:0] ANtb;
    wire DP;
    
    Display7seg UUT(.A(Atb), .Y(Ytb), .AN(ANtb), .DP(DPtb));
    
    initial begin
        
        Atb = 4'b0000; #100;
        Atb = 4'b0001; #100;
        Atb = 4'b0010; #100; 
        Atb = 4'b0011; #100; 
        Atb = 4'b0100; #100; 
        Atb = 4'b0101; #100; 
        Atb = 4'b0110; #100; 
        Atb = 4'b0111; #100; 
        Atb = 4'b1000; #100; 
        Atb = 4'b1001; #100; 
        Atb = 4'b1010; #100;
        Atb = 4'b1011; #100; 
        Atb = 4'b1100; #100; 
        Atb = 4'b1101; #100; 
        Atb = 4'b1110; #100; 
        Atb = 4'b1111; #100; 
        
        $stop;
    
    end


endmodule
