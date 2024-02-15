`timescale 1ns / 1ps

module ControlUnit(
    input [1:0] state,
    input [11:0] insreg,
    input [3:0] statereg,
    output reg [3:0] ALU_mode,
    output reg sel_MUX1, sel_MUX2,
    output reg PC_E, Acc_E, SR_E, IR_E, DR_E, PM_E, PM_LE, DM_E, DM_WE, ALU_E
);
    localparam LOAD = 2'b00,
               FETCH = 2'b01,
               DECODE = 2'b10,
               EXECUTE = 2'b11;
               
    always @* begin
        PM_LE = 0; //program memory load enable
        PM_E = 0; //program memory enable
        DM_E = 0; //data memory enable
        DM_WE = 0; //data memory write enable
        PC_E = 0; //program counter enable
        Acc_E = 0; // Accumulator enable
        SR_E = 0; //State enable
        IR_E = 0; //Instruction enable
        DR_E = 0; //data register enable
        ALU_E = 0; //ALU enable
        ALU_mode = 4'b0000; //ALU Mode
        sel_MUX1 = 0; //MUX1 selection
        sel_MUX2 = 0; //MUX2 selection
        
        case(state)
        LOAD:begin
            PM_LE = 1;
            PM_E = 1;
        end
        
        FETCH:begin
            IR_E = 1;
            PM_E = 1;
        end
        
        DECODE:begin
            if(insreg[11:9] == 3'b001) begin
                DR_E = 1;
                DM_E = 1;
            end
            else begin
                DR_E = 0;
                DM_E = 0;
            end
        end
        
        EXECUTE:begin
            if(insreg[11]==1)begin
                PC_E = 1;
                Acc_E = 1;
                SR_E = 1;
                ALU_E = 1;
                ALU_mode = insreg[10:8];
                sel_MUX1 = 1;
                sel_MUX2 = 0;
            end
            else if(insreg[10]==1) begin
                PC_E = 1;
                sel_MUX1 = statereg[insreg[9:8]];
            end
            else if(insreg[9]==1) begin
                PC_E = 1;
                Acc_E = insreg[8];
                SR_E = 1;
                DM_E = !insreg[8];
                DM_WE = !insreg[8];
                ALU_E = 1;
                ALU_mode = insreg[7:4];
                sel_MUX1 = 1;
                sel_MUX2 = 1;
            end
            else if(insreg[8] == 0) begin
                PC_E = 1;
                sel_MUX1 = 1;
            end
            else begin
                PC_E = 1;
                sel_MUX1 = 0;
            end
        end
        endcase
    end
endmodule