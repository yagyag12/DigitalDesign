`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 22:19:31
// Design Name: 
// Module Name: main
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


module main(
    input CLK,RST,
    output [1:0] cur_state
    );
    
    localparam LOAD = 2'b00,
               FETCH = 2'b01,
               DECODE = 2'b10,
               EXECUTE = 2'b11;

    reg [1:0] current_state, next_state;
    reg [11:0] program_memory [9:0];
    reg load_done;
    reg [7:0] load_addr;
    wire [11:0] load_ins;
    reg [7:0] PC, DR, Acc;
    reg [11:0] IR;
    reg [3:0] SR;
    wire PC_E, Acc_E, SR_E, DR_E, IR_E;
    reg PC_CLR, Acc_CLR, SR_CLR, DR_CLR, IR_CLR;
    wire [7:0] PC_updated, DR_updated;
    wire [11:0] IR_updated;
    wire [3:0] SR_updated;
    wire PM_E, DM_E, DM_WE, ALU_E, PM_LE, sel_MUX1, sel_MUX2;
    wire [3:0] ALU_mode;
    wire [7:0] adder_out;
    wire [7:0] ALU_out, ALU_op2;

    assign cur_state = current_state;


    initial begin
        $readmemb("program_mem.dat",program_memory,0,9);
    end
    
    ALU ALU(
            .op1(Acc),
            .op2(ALU_op2),
            .en(ALU_E),
            .mode(ALU_mode),
            .cflags(SR),
            .out(ALU_out),
            .flags(SR_updated)
            );
    
    MUX1 MUX2(
              .sel(sel_MUX2),
              .ina(DR),
              .inb(IR[7:0]),
              .out(ALU_op2)
              );
    
    datamem DM(
               .clk(CLK),
               .en(DM_E),
               .we(DM_WE),
               .addr(IR[3:0]),
               .din(ALU_out),
               .dout(DR_updated)
               );
    
    programmem PM(
                  .clk(CLK),
                  .en(PM_E),
                  .load(PM_LE),
                  .addr(PC),
                  .load_addr(load_addr),
                  .load_ins(load_ins),
                  .ins(IR_updated)
                  );
    
    adder PCADDER(
                  .in(PC),
                  .out(adder_out)
                  );
    
    MUX1 MUX1(
              .sel(sel_MUX1),
              .ina(adder_out),
              .inb(IR[7:0]),
              .out(PC_updated)
              );
    
    ControlUnit CONTROL(
                        .state(current_state),
                        .insreg(IR),
                        .statereg(SR),
                        .ALU_mode(ALU_mode),
                        .sel_MUX1(sel_MUX1),
                        .sel_MUX2(sel_MUX2),
                        .PC_E(PC_E),
                        .Acc_E(Acc_E),
                        .SR_E(SR_E),
                        .IR_E(IR_E),
                        .DR_E(DR_E),
                        .PM_E(PM_E),
                        .PM_LE(PM_LE),
                        .DM_E(DM_E),
                        .DM_WE(DM_WE),
                        .ALU_E(ALU_E)
                        );
    
    //ASSIGNMENTS
    assign load_ins = program_memory[load_addr];
    
    
    always @(posedge CLK) begin
        if(RST==1) begin
            load_addr <= 0;
            load_done <= 0;
        end
        else if(PM_LE==1) begin
            load_addr <= load_addr + 8'd1;
            if(load_addr == 8'd9) begin
                load_addr <= 8'd0;
                load_done <= 1;
            end
            else begin
                load_done <= 0;
            end
        end
    end
    
    //SEQUENTIAL STATE
    always @(posedge CLK) begin
        if(RST==1) current_state <= LOAD;
        else current_state <= next_state;
    end
    
    always @* begin
        PC_CLR = 0;
        Acc_CLR = 0;
        SR_CLR = 0;
        DR_CLR = 0;
        IR_CLR = 0;
        case(current_state)
            
        LOAD: begin
            if(load_done == 1) begin
                next_state = FETCH;
                PC_CLR = 1;
                Acc_CLR = 1;
                SR_CLR = 1;
                DR_CLR = 1;
                IR_CLR = 1;
            end
            else next_state = LOAD;
        end
        
        FETCH: begin
            next_state = DECODE;
        end
        
        DECODE: begin
            next_state = EXECUTE;
        end
        
        EXECUTE: begin
            next_state = FETCH;
        end  
        endcase
    end
    
    always @(posedge CLK) begin
        if(RST==1)begin
            PC <= 8'd0;
            Acc <= 8'd0;
            SR <= 4'd0;
        end
        else begin
            if(PC_E == 1) PC <= PC_updated;
            else if(PC_CLR==1) PC <= 8'd0;
            
            if(Acc_E==1) Acc <= ALU_out;
            else if (Acc_CLR == 1) Acc <= 8'd0;
            
            if(SR_E == 1) SR <= SR_updated;
            else if(SR_CLR==1) SR <= 4'd0;
        end
    end
    
    
    always @(posedge CLK) begin
        if(DR_E==1) DR <= DR_updated;
        else if(DR_CLR==1) DR <= 8'd0;
        
        if(IR_E==1) IR <= IR_updated;
        else if(IR_CLR==1) IR <= 12'd0;
    end
    
    endmodule
























