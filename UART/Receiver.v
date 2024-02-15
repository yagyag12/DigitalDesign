`timescale 1ns / 1ps

module Receiver 
#(parameter SB_TICK = 16)
(
    input clk,rstn,rx,stick,
    output reg rxtick,
    output [7:0] out
);
    
    localparam 
        idle = 0,
        start = 1,
        data = 2,
        stop = 3;

reg [1:0] state_reg, next_state;
reg [3:0] sreg, snext;
reg [2:0] nreg, nnext;
reg [7:0] breg, bnext;

always @(posedge clk, negedge rstn)
begin
    if(!rstn) begin
        state_reg <= idle;
        sreg <= 0;
        nreg <= 0;
        breg <= 0;
    end
    
    else begin
        state_reg <= next_state;
        sreg <= snext;
        nreg <= nnext;
        breg <= bnext;
    end
end

always @* begin
    next_state = state_reg;
    snext = sreg;
    nnext = nreg;
    bnext = breg;
    rxtick = 0;

    case(state_reg)
        idle:
            if(!rx) begin
                snext = 0;
                next_state = start;
            end
            
        start:
            if(stick)
                if(sreg == 7) begin
                    snext = 0;
                    nnext = 0;
                    next_state = data;
                end
                else snext = sreg + 1;
                
        data:
            if(stick)
                if(sreg == 15) begin
                    snext = 0;
                    bnext = {rx,breg[7:1]};
                    if(nreg == 7) next_state = stop;
                    else nnext = nreg  + 1;
                end
                else snext = sreg + 1;
        
        stop:
            if(stick)
                if(sreg == (SB_TICK - 1))
                begin
                    rxtick = 1;
                    next_state = idle;
                end
                else snext = sreg + 1;
                
        default: next_state = idle;
    endcase     
end

assign out = breg;
endmodule