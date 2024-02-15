`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Created by Yagiz YAGMUR
// Create Date: 16.07.2023 17:24:34
// Module Name: modcounter
// Description: Modulus Counter
// 
//////////////////////////////////////////////////////////////////////////////////


module modcounter #(parameter N = 8, //parameter for the mod
                    parameter WIDTH = 4) //parameter for the data width
    (
    input clk,//clock signal
    input rstn, //Active-0 Reset
    output reg [WIDTH-1:0] out // Counter
    );
    
    always @(posedge clk) begin
        if(!rstn) out <= 0;
        else begin
            if(out == N-1)begin
                out <= 0;
                end
            else out <= out + 1; 
        end
    end
endmodule
