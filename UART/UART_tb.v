`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2023 20:08:54
// Design Name: 
// Module Name: UART_tb
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


module UART_tb(

    );
    reg clk,rstn,RX,rduart,wruart;
    reg [1:0] sel;
    reg [7:0] wdata;
    
    wire rx_empty, txfull, TX;
    wire [7:0] rdata;
    
    UART uut(.clk(clk),
             .rstn(rstn),
             .RX(RX),
             .rduart(rduart),
             .rx_empty(rx_empty),
             .rdata(rdata),
             .wdata(wdata),
             .wruart(wruart),
             .txfull(txfull),
             .TX(TX),
             .sel(sel));
             
             
    wire tick;
    
    BaudRate_Generator generator(sel,clk,rstn,tick);
             
    always #5 clk <= ~clk;
    
    task writebyte;
        input [7:0] data;
        integer i;
        begin
            rduart <= 1'b1;
            RX <= 1'b1;
            #10400;
            
            for(i = 0; i<8 ; i = i + 1)begin
                RX <= data[i];
                #10400;
            end
            
            RX <= 1'b0;
            #10400;
            //rduart<=1'b0;
        end
    endtask
    
    initial begin
        clk <= 0;
        sel <= 0;
        rstn <= 1; 
        rduart<= 1;
        
        #20;
        rstn <= 0;
        #20;
        rstn <= 1;
        @(posedge clk);
        
        //TX TEST
        
        @(posedge clk);
        wruart<=1;
        wdata <= 8'b11110000;
        @(posedge clk);
        wruart<=0;
        
        
        //RX TEST
        
        @(posedge clk);
        writebyte(8'b10101010);
        @(posedge clk);
        
    
    end
endmodule
