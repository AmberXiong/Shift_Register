`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ccnu
// Engineer: Poyi Xiong
// 
// Create Date: 01/11/2017 05:07:50 PM
// Design Name: 
// Module Name: clock_div_tb
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


module clock_div_tb();
reg clk_in;
reg [3:0] div;
reg rst;
wire clk_out;

Clock_Div DUT0(
    .clk_in(clk_in),
    .div(div),
    .rst(rst),
    .clk_out(clk_out)
    );
    
 initial begin
 $dumpfile("clock_div.dump");
 $dumpvars(0,Clock_Div); 
 end
 
 initial begin
 clk_in=0;
 forever #5 clk_in=~clk_in;
 end
 
 initial begin
 rst=1;
 #100 rst=0;
 end
 
 initial begin
 div=4'b0001;
 #1000 div=4'b0010;
 #1000 div=4'b0100;
 #1000 div=4'b1000;
 end
endmodule
