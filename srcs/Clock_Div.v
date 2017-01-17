`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ccnu
// Engineer: Poyi Xiong
// 
// Create Date: 01/11/2017 04:32:09 PM
// Design Name: 
// Module Name: Clock_Div
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


module Clock_Div(
    input clk_in,
    input [3:0] div,
    input rst,
    output reg  clk_out
    );
 reg [2:0] count;
 reg clk_div2;
 reg clk_div4;
 reg clk_div8;
// wire clk_temp;
 
//assign clk_temp=clk_in;
 
 always@(posedge clk_in or posedge rst)
  begin
   if(rst)
    begin
     count<=3'b0;
    end
   else
    begin
     if(count==3'b111)
      begin
       count<=3'b0;
      end
     else
      begin
       count<=count+1'b1;
      end
    end
  end
 
 always@(posedge clk_in or posedge rst)
  begin
   if(rst)
    begin
     clk_div2<=1'b0;
     clk_div4<=1'b0;
     clk_div8<=1'b0;
    end
   else
    begin
     clk_div2<=count[0];
     clk_div4<=count[1];
     clk_div8<=count[2];
    end
  end
  
 always@(div or rst or clk_in or clk_div2 or clk_div4 or clk_div8)
  begin
   if(rst)
    begin
     clk_out=0;
    end
   else
    begin
     case(div)
      4'b0001: clk_out=clk_in;
      4'b0010: clk_out=clk_div2;
      4'b0100: clk_out=clk_div4;
      4'b1000: clk_out=clk_div8;
      default: clk_out=clk_in;
     endcase
    end
  end
endmodule
