`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Yaðýz YAÐMUR 
// Create Date: 23.07.2023 00:38:44
// Module Name: sequence_detector_tb
// Description: Testbench for sequence_detector module
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector_tb();

    //Initialize inputs as registers and outputs as wires
    reg seqin,clk,rstn;
    wire out;
    
    sequence_detector uut(clk,rstn,seqin,out); //Adds the module into the testbench
    
    always #5 clk = ~clk; //Creates 10MHz Clock signal
    
    //Starts the tests
    initial begin
        clk = 0;
        seqin = 0;
        rstn = 1;
        #10;
        rstn = 0;
        #10;
        rstn = 1;
        #10;
        seqin = 1; #10;
        seqin = 0; #10;
        seqin = 1; #10;
        seqin = 1; #10;
        
        seqin = 1; #10;
        seqin = 0; #10;
        seqin = 1; #10;
        seqin = 1; #10;
        
        seqin = 1; #10;
        seqin = 0; #10;
        seqin = 1; #10;
        seqin = 0; #10;
    end
endmodule
