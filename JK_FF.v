`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Yaðýz YAÐMUR
// Create Date: 15.07.2023 13:00:28
// Design Name: JK Flip Flop 
// Module Name: JK_FF
// Description: A simple JK Flip Flop Circuit
// 
//////////////////////////////////////////////////////////////////////////////////


module JK_FF(
    input clk, //Clock signal
    input J, K, //J and K inputs
    output reg Q, //State output
    output nQ //Not State Output
    );
    
    assign nQ = ~Q; //nQ is assigned to "not Q"
    
    always @(posedge clk) begin
    case({J,K})
        2'b00: Q <= Q;
        2'b01: Q <= 1'b0;
        2'b10: Q <= 1'b1; 
        2'b11: Q <= ~Q;
        endcase
        // Q_next = J ~Q + ~K Q
    end 
endmodule
