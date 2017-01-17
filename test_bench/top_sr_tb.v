`timescale 1ns / 1ps
`define WIDTH 170
//////////////////////////////////////////////////////////////////////////////////
// Company: ccnu
// Engineer: Poyi Xiong
// 
// Create Date: 01/13/2017 04:41:05 PM
// Design Name: 
// Module Name: top_sr_tb
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


module top_sr_tb();
reg clk_in;
reg rst;
reg [3:0] div;
reg start;
reg [`WIDTH-1:0] din;
reg dout_sr;
wire clk_sr;
wire din_sr;
wire load_sr;
wire [`WIDTH-1:0] dout;

Top_SR DUT4(
    .clk_in(clk_in),
    .rst(rst),
    .div(div),
    .start(start),
    .din(din),
    .dout_sr(dout_sr),
    .clk_sr(clk_sr),
    .din_sr(din_sr),
    .load_sr(load_sr),
    .dout(dout)
    );
    
initial begin
$dumpfile("top_sr.dump");
$dumpvars(0, Top_SR);
end

initial begin
clk_in=0;
forever #25 clk_in=~clk_in;
end
 
initial begin
rst=0;
#100 rst=1;
#100 rst=0;
end

initial begin
div=4'b0010;
end

initial begin
din={1'b1,169'b1011};
start=0;
#675 start=1;
#100 start=0;
end

initial begin
dout_sr=0;
#17875 dout_sr=1;
#100 dout_sr=1;
#100 dout_sr=0;
#100 dout_sr=1;
end

endmodule
