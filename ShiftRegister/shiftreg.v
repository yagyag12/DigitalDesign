`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Created by Yagiz YAGMUR
// Create Date: 16.07.2023 11:23:38
// Module Name: shiftreg
// Description: 4-bit Bidirectional Shift Register
// 
//////////////////////////////////////////////////////////////////////////////////

module shiftreg(
    input clk, //Clock signal
    input data, //Data input
    input en, //Active-1 Enable
    input dir, //Direction input
    input rstn, //Active-0 Reset
    output reg [3:0] out //Output
    );
    
    always @(posedge clk)begin
        if(!rstn) out <= 0; //Reset
        else begin
            if(en) //Checks enable
                case(dir) //Selects direction
                    0: out <= {out[2:0], data};
                    1: out <= {data, out[3:1]};
                endcase
            else out <= out;  
        end
    end
    
endmodule
