`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Yaðýz YAÐMUR 
// Create Date: 23.07.2023 00:10:08 
// Module Name: sequence_detector
// Description: "1011" Sequence Detector. A basic project to understand FSMs.
//
//////////////////////////////////////////////////////////////////////////////////

module sequence_detector(
    input clk, // Clock signal 
    input rstn, //Active-0 Reset
    input seqin, //Data input
    output reg out //Detector Output
    );
    //Parameters to enumerate states
    localparam zero=3'b000,
               one=3'b001,
               onezero=3'b010,
               onezeroone=3'b011,
               onezerooneone=3'b100;
               
    reg [2:0] current_state, next_state; //state registers
    
    //Sequential Part
    always @(posedge clk, negedge rstn)
    begin
        if(!rstn) current_state <= zero;
        else current_state <= next_state;
    end
    
    //All States
    always @* begin
        case(current_state)
        zero:begin
            out = 0;
            if(seqin==1) next_state = one;
            else next_state = zero;       
        end
        one:begin
            out = 0;
            if(seqin==0) next_state = onezero;
            else next_state = one;
        end
        onezero:begin
            out = 0;
            if(seqin==0) next_state = onezero;
            else next_state = onezeroone;
        end
        onezeroone:begin
            out = 0;
            if(seqin==0) next_state = onezero;
            else next_state = onezerooneone;
        end
        onezerooneone:begin
            out = 1;
            if(seqin==0) next_state = onezero;
            else next_state = one;
        end
        default: begin
        next_state = zero; 
        out = 0;
        end
        endcase
    end
    
endmodule
