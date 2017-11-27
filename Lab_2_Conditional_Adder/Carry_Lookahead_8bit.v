`timescale 1ns / 1ps
module Carry_Lookahead_8bit(
    input[7:0] x,
    input[7:0] y,
    input mode,
    input cin,
    output[7:0] sum,
    output cout

    );
    
    wire cout1;
    
Carry_Lookahead_4bit_block#(4) CarLook1 (
    .x(x[3:0]),
    .y(y[3:0]),
    .mode(mode),
    .cin(cin),
    .sum(sum[3:0]),
    .cout(cout1)
    );
Carry_Lookahead_4bit_block#(4) CarLook2 (
    .x(x[7:4]),
    .y(y[7:4]),
    .mode(mode),
    .cin(cout1),
    .sum(sum[7:4]),
    .cout(cout)
    );        
    
endmodule
