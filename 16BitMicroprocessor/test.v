`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2023 15:34:53
// Design Name: 
// Module Name: test
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


module test(

    );
    reg clk,rst;
    wire [1:0] cur;
    
    main uut(clk,rst,cur);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #50;
        rst = 0;
    end
endmodule
