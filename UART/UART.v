`timescale 1ns / 1ps

module UART
    #(parameter SB_TICK = 16)
    (
    input clk, rstn,
    
    input RX, rduart,
    output rx_empty,
    output [7:0] rdata,
    
    input [7:0] wdata,
    input wruart,
    output txfull, TX,
    
    input [1:0] sel
    );
    
    
    //BAUDRATE GENERATOR
    wire tick;
    BaudRate_Generator BAUD(.sel(sel),
                            .clk(clk),
                            .rstn(rstn),
                            .tick(tick));
                 
                 
     //RECEIVER       
     wire rxtick;
     wire [7:0] rxout;
     Receiver #(.SB_TICK(SB_TICK))RECEIVER(.clk(clk),
                                           .rstn(rstn),
                                           .rx(RX),
                                           .stick(tick),
                                           .rxtick(rxtick),
                                           .out(rxout));


    fifo_generator_0 RX_FIFO (
      .clk(clk),      // input wire clk
      .srst(~rstn),    // input wire srst
      .din(rxout),      // input wire [7 : 0] din
      .wr_en(rxtick),  // input wire wr_en
      .rd_en(rduart),  // input wire rd_en
      .dout(rdata),    // output wire [7 : 0] dout
      .full(),    // output wire full
      .empty(rx_empty)  // output wire empty
    );
    
    
    //TRANSMITTER

    wire tx_empty, txtick;
    wire [7:0] datain;
    
    Transmitter #(.SB_TICK(SB_TICK)) TRANSMITTER(.clk(clk),
                                                .rstn(rstn),
                                                .txstart(!tx_empty),
                                                .stick(tick),
                                                .datain(datain),
                                                .txtick(txtick),
                                                .tx(TX));
                                            
 

fifo_generator_0 TX_FIFO (
  .clk(clk),      // input wire clk
  .srst(~rstn),    // input wire srst
  .din(wdata),      // input wire [7 : 0] din
  .wr_en(wruart),  // input wire wr_en
  .rd_en(txtick),  // input wire rd_en
  .dout(datain),    // output wire [7 : 0] dout
  .full(txfull),    // output wire full
  .empty(tx_empty)  // output wire empty
);

endmodule