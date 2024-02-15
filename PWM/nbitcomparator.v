`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 13:33:13
// Design Name: 
// Module Name: nbitcomparator
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


//4-bit comparator
module nbitcomparator(
  
    input [3:0] A,
    input [3:0] B,
    output Ab,ab,aB
    );
    integer i;
    reg [2:0] out;
    
    assign Ab = out[2];
    assign ab = out[1];
    assign aB = out[0];
    
    always @* begin
        if(A==B)begin
            out[2]<=0;
            out[1]<=1;
            out[0]<=0;
        end
        
        else if(A>B)begin
            out[2]<=1;
            out[1]<=0;
            out[0]<=0;            
        end
        
        else begin
           out[2]<=0;
           out[1]<=0;
           out[0]<=1;       
        end
        
    end
endmodule
