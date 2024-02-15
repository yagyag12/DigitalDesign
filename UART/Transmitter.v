`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2023 14:05:28
// Design Name: 
// Module Name: Transmitter
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


module Transmitter #(parameter SB_TICK = 16)(
    input clk, rstn, txstart, stick,
    input [7:0] datain,
    output reg txtick,
    output tx
    );
    
    localparam  idle = 0,
                start = 1,
                data = 2,
                stop = 3;
                
    reg [1:0] state_reg, next_state;
    reg [3:0] sreg, snext;
    reg [2:0] nreg, nnext;
    reg [7:0] breg, bnext;
    reg txreg,txnext;
    
    always @(posedge clk, negedge rstn)
    begin
        if(!rstn) begin
            state_reg <= idle;
            sreg <= 0;
            nreg <= 0;
            breg <= 0;
            txreg <= 1;
        end
        else begin
            state_reg <= next_state;
            sreg <= snext;
            nreg <= nnext;
            breg <= bnext;
            txreg <= txnext;
        end
    end
    
    always @* begin
        next_state = state_reg;
        snext = sreg;
        nnext = nreg;
        bnext = breg;
        txtick = 0;
        
        case(state_reg)
            idle: begin
                txnext = 1;
                if(txstart) begin
                    snext = 0;
                    bnext = datain;
                    next_state = start;
                end
            end
            start: begin
                txnext = 0;
                if(stick)
                    if(sreg==15) begin
                        snext = 0;
                        nnext = 0;
                        next_state = data;
                    end
                    else snext = sreg + 1;
            end
            data: begin
                txnext = breg[0];
                if(stick)
                    if(sreg == 15) begin
                        snext = 0;
                        bnext = {1'b0, breg[7:1]};
                        if(nreg == 7) next_state = stop;
                        else nnext = nreg + 1;
                    end
                    else snext = sreg + 1;
            end
            stop: begin
                txnext = 1;
                if(stick)
                    if(sreg == (SB_TICK -1)) begin
                        txtick = 1;
                        next_state = idle;
                    end
                    else snext = sreg + 1;
            end
            default: next_state = idle;
         endcase
    end
    
assign tx = txreg;
endmodule
