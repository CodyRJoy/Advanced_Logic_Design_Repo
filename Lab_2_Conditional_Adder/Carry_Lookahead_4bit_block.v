`timescale 1ns / 1ps
module Carry_Lookahead_4bit_block(

input [3:0] x,
input [3:0] y,
input mode,
input cin,
output [3:0] sum,
output cout
    );

wire [3:0] yt;
wire [3:0] gen;
wire [3:0] prop;
wire [4:0] car;
//wire [3:0] answer;

assign car[0] = cin;
assign cout = car[4];

generate
genvar i;
    for(i=0;i<4;i=i+1) begin
        assign yt[i] = y[i]^mode;
        assign prop[i] = x[i]|yt[i];
        assign gen[i] = x[i]&yt[i];
    end
endgenerate

assign car[1] = gen[0]|(prop[0]&car[0]);
assign car[2] = gen[1]|(prop[1]&gen[0])|(prop[1]&prop[0]&car[0]);
assign car[3] = gen[2]|(prop[2]&car[1])|(prop[2]&prop[1]&gen[0])|(prop[2]&prop[1]&prop[0]&car[0]);
assign car[4] = gen[3]|(prop[3]&gen[2])|(prop[3]&prop[2]&gen[1])|(prop[3]&prop[2]&prop[1]&gen[0])|(prop[3]&prop[2]&prop[1]&prop[0]&car[0]);
assign sum[3:0] = x[3:0]^yt[3:0]^car[3:0];
    
endmodule
