`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 10:15:22
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb(

    );
    reg clk, we;
    reg [3:0] di;
    reg [2:0] address;
    wire [3:0] do;
    integer i;
    RAM r1(clk,we,di,address,do);
    
    always begin
        clk = ~clk;
        #5;
    end
    
    initial begin
        clk <= 0;
        we <= 0;
        di <= 0;
        address <= 0;
        #20;
        
        we <= 1;
        
        for(i=1; i<=8; i = i + 1)begin
            di = i;
            address = i-1;
            #10;
        end
        
        we <= 0;
        for(i=1; i<=8; i = i + 1)begin
            address = i-1;
            #10;
        end            
    end
endmodule
