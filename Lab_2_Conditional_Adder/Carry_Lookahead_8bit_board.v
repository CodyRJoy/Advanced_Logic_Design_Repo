`timescale 1ns / 1ps
module Carry_Lookahead_8bit_board(
    input [15:0]SW,
    input BTNC,
    output [8:0]LED

    );
    
    wire cout1;
    
Carry_Lookahead_4bit_block#() CarLook1 (
    .x(SW[3:0]),
    .y(SW[11:8]),
    .mode(BTNC),
    .cin(BTNC),
    .sum(LED[3:0]),
    .cout(cout1)
    );
Carry_Lookahead_4bit_block#() CarLook2 (
    .x(SW[7:4]),
    .y(SW[15:12]),
    .mode(BTNC),
    .cin(cout1),
    .sum(LED[7:4]),
    .cout(LED[8])
    );        
    
endmodule
