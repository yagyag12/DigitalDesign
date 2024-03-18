`timescale 1ns / 1ps

module carry_ripple_adder_tb();
    reg [3:0] A,B;
    wire [3:0] Y;
    wire Cout;
    
    carry_ripple_adder UUT(.A(A), .B(B), .Cout(Cout), .Y(Y));
    
    initial begin
        A = 4'b0000;
        B = 4'b0000;
        #10;
        A = 4'b0001;
        B = 4'b0000;
        #10;
        A = 4'b0010;
        B = 4'b0001;
        #10;
        A = 4'b0100;
        B = 4'b0010;
        #10;
        A = 4'b0111;
        B = 4'b0111;
        #10;
        A = 4'b1000;
        B = 4'b0111;
        #10;
        A = 4'b1001;
        B = 4'b0111;
        #10;
        A = 4'b1010;
        B = 4'b1010;
        #10;
        A = 4'b1100;
        B = 4'b1101;
        #10;
        A = 4'b1111;
        B = 4'b1110;
        #10;
        A = 4'b1111;
        B = 4'b1111;
        #10;
            
        $stop;                                                                              
    end

endmodule
