`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Yaðýz YAÐMUR
// Create Date: 25.07.2023 21:14:46
// Design Name: Toggle Flip Flop 
// Module Name: T_FF
// Description: A simple Toggle Flip Flop Circuit with Asynchronous Low Set and Reset
// NOTE: I added set and reset to this flip flop so that Q can have an initial value.
// Otherwise the state is stuck as X. Also Set and Reset inputs are Active-0, which
// means they are normally valued HIGH and they become activated when their values are 
// set to LOW.
//////////////////////////////////////////////////////////////////////////////////

module T_FF(
    input clk, //Clock signal
    input reset, set, //Reset and Set inputs
    input T, //T input
    output reg Q, //Output State
    output nQ //Not State Output
    );
    
    assign nQ = ~Q; //nQ is assigned to "not Q"
    
    always @(posedge clk or negedge set or negedge reset) begin
        if(set==0) Q <= 1; // SET is activated
        
        else if(reset==0) Q <= 0; //RESET is activated
        
        // If toggle input in one it reverses the state output
        else if(T==1) Q <= ~Q;
        else Q <= Q; 
    end
endmodule