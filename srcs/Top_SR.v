`timescale 1ns / 1ps
`define WIDTH 170
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2017 02:15:00 PM
// Design Name: 
// Module Name: Top_SR
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


module Top_SR(
    input clk_in,
    input rst,
    input [3:0] div,
    input start,
    input [`WIDTH-1:0] din,
    input dout_sr,
    output clk_sr,
    output din_sr,
    output load_sr,
    output [`WIDTH-1:0] dout
    );

wire clk;  

Clock_Div clock_div_0(
        .clk_in(clk_in),
        .div(div),
        .rst(rst),
        .clk_out(clk)
        );
            
SR_Control sr_control_0(
         .din(din),
         .clk(clk),
         .rst(rst),
         .start(start),
         .din_sr(din_sr),
         .load_sr(load_sr),
         .clk_sr(clk_sr)
        );
        
Recieve_Data recieve_data_0(
        .dout_sr(dout_sr),
        .clk(clk),
        .rst(rst),
        .load_sr(load_sr),
        .dout(dout)
        );                         
endmodule
