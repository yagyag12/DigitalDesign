`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 14:05:20
// Design Name: 
// Module Name: nbitcomparator_tb
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


module nbitcomparator_tb(

    );
    reg [3:0] A;
    reg [3:0] B;
    
    wire Ab, ab, aB;
    
    nbitcomparator c4(A,B,Ab,ab,aB);
    
    initial begin
    
    A = 4'b1110;
    B = 4'b1110;
    #20;
 
    A = 4'b0011;
    B = 4'b0010;
    #20;  
    
    A = 4'b1001;
    B = 4'b1100;
    #20;
   
    end
endmodule
