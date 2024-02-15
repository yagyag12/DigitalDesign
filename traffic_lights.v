`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2023 23:41:12
// Design Name: 
// Module Name: traffic_lights
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

/*
module traffic_lights #(parameter GREENTIMER = 6, 
                        parameter YELLOWTIMER = 2, 
                        parameter REDTIMER = 6)(
    input clk, rstn,
    output red,green,yellow,
    output [2:0] count,
    output [1:0] currentstate
    );
    
    reg [2:0] timer;
    reg [1:0] state_reg, next_state;
    reg [2:0] lights, next_lights;
    
    assign count = timer;
    assign currentstate = state_reg;
    assign red = lights [0];
    assign yellow = lights [1];
    assign green = lights [2];
    
    localparam redon = 0, yellowtogreen = 1, greenon = 2,  yellowtored = 3;
    
    
    
    always @(posedge clk, negedge rstn) begin
        if(!rstn) begin
            state_reg <= redon;
            timer <= 0;
            lights <= 3'b001;
        end
        else begin
            state_reg <= next_state;
            lights <= next_lights;
            end
        end
        
        always @* begin
            next_state = state_reg;
            next_lights = lights;
            
            case(state_reg)
            redon: begin
                next_lights = 3'b001;
                if(timer == REDTIMER-1) begin
                    next_lights = 3'b010;
                    timer = 0;
                    next_state = yellowtogreen;
                end
                else begin
                timer = timer + 1;
                next_state = redon;   
                end
            end
            
            yellowtogreen: begin
                next_lights = 3'b010;
                if(timer == YELLOWTIMER-1) begin
                    next_lights = 3'b100;
                    timer = 0;
                    next_state = greenon;
                end
                else begin
                timer = timer + 1; 
                end
            end
            
            yellowtored: begin
                next_lights = 3'b010;
                if(timer == YELLOWTIMER-1) begin
                    next_lights = 3'b001;
                    timer = 0;
                    next_state = redon;
                end
                else begin
                timer = timer + 1; 
                end
            end
            
            greenon: begin
                next_lights = 3'b100;
                if(timer == GREENTIMER-1) begin
                    next_lights = 3'b010;
                    timer = 0;
                    next_state = yellowtored;
                end
                else begin
                timer = timer + 1;                
                end
            end
           
            default: begin
                next_state = redon;
                next_lights = 3'b001;
            end
            
        endcase
            end

        
   
endmodule

*/


module traffic_lights #(parameter GREENTIMER = 6, 
                        parameter YELLOWTIMER = 2, 
                        parameter REDTIMER = 8)(
    input clk, rstn,
    output red,green,yellow
    );
    
    reg [2:0] timer;
    reg [1:0] state_reg;
    reg [2:0] lights;
    assign red = lights [0];
    assign yellow = lights [1];
    assign green = lights [2];
    
    localparam redon = 0, greenon = 1, yellowtogreen = 2, yellowtored = 3;
    
    
    
    always @(posedge clk, negedge rstn) begin
        if(!rstn) begin
            state_reg <= redon;
            timer <= 0;
        end
        else begin
            //state_reg <= next_state;
            case(state_reg)
            redon: begin
                if(timer == REDTIMER-1) begin
                    lights = 3'b010;
                    timer = 0;
                    state_reg = yellowtogreen;
                end
                else begin
                timer = timer + 1;   
                lights = 3'b001;
                end
            end
            
            yellowtogreen: begin
                if(timer == YELLOWTIMER-1) begin
                    lights = 3'b100;
                    timer = 0;
                    state_reg = greenon;
                end
                else begin
                timer = timer + 1; 
                lights = 3'b010;
                end
            end
            
            yellowtored: begin
                if(timer == YELLOWTIMER-1) begin
                    lights = 3'b001;
                    timer = 0;
                    state_reg = redon;
                end
                else begin
                timer = timer + 1; 
                lights = 3'b010;
                end
            end
            
            greenon: begin
                if(timer == GREENTIMER-1) begin
                    lights = 3'b010;
                    timer = 0;
                    state_reg = yellowtored;
                end
                else begin
                timer = timer + 1;                
                lights = 3'b100;
                end
            end
           
            default: begin
                lights = 3'b001;
                state_reg = redon;
            end
            
        endcase
            end
    end

        
   
endmodule
