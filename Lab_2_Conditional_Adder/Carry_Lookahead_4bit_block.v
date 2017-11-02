`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2017 04:04:06 PM
// Design Name: 
// Module Name: Carry_Lookahead_4bit_block
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


module Carry_Lookahead_4bit_block(

input [3:0] x,
input [3:0] y,
input mode,
input cin,
output [3:0] sum,
output [3:0] answer,
output cout
    );

wire [3:0] yt;
wire [3:0] gen;
wire [3:0] prop;
wire [4:0] car;

assign car[0] = cin|mode;
assign cout = car[4];

generate
genvar i;
    for(i=0;i<4;i=i+1) begin
        assign yt[i] = y[i]^mode;
        assign prop[i] = x[i]^yt[i];
        assign gen[i] = x[i]&yt[i];
    end
endgenerate

assign car[1] = gen[0]|(prop[0]&car[0]);
assign car[2] = gen[1]|(prop[1]&gen[0])|(prop[1]&prop[0]&car[0]);
assign car[3] = gen[2]|(prop[2]&car[1])|(prop[2]&prop[1]&gen[0])|(prop[2]&prop[1]&prop[0]&car[0]);
assign car[4] = gen[3]|(prop[3]&gen[2])|(prop[3]&prop[2]&gen[1])|(prop[3]&prop[2]&prop[1]&gen[0])|(prop[3]&prop[2]&prop[1]&prop[0]&car[0]);
assign sum[3:0] = prop[3:0]^car[3:0];

assign answer[3:0] = car[4:1];
    
endmodule
